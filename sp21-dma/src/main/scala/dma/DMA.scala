package ee290cdma

import chisel3._
import chisel3.util._
import chisel3.experimental._
//import freechips.rocketchip.config.Parameters
import org.chipsalliance.cde.config.{Parameters, Field, Config}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy.{IdRange, LazyModule, LazyModuleImp}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.rocket.constants.{MemoryOpConstants}
import freechips.rocketchip.tilelink.{TLIdentityNode, TLXbar}
import freechips.rocketchip.tilelink._
//import testchipip.TLHelper

class EE290CDMAWriterReq(val addrBits: Int, val beatBytes: Int) extends Bundle {
  val addr = UInt(addrBits.W)
  val data = UInt((beatBytes * 8).W)
  val totalBytes = UInt(log2Ceil(beatBytes + 1).W)
}

class EE290CDMAReaderReq(val addrBits: Int, val maxReadBytes: Int) extends Bundle {
  val addr = UInt(addrBits.W)
  val totalBytes = UInt((log2Ceil(maxReadBytes+1)).W)
}

class EE290CDMAReaderResp(val maxReadBytes: Int) extends Bundle {
  val bytesRead = UInt((log2Ceil(maxReadBytes+1)).W)
}

/*
Builds beatByte wide data packets for the DMA from the one-byte wide packets
 */
class DMAPacketAssemblerDMAOUTIO(val beatBytes: Int) extends Bundle {
  val data = UInt((beatBytes*8).W)
  val size = UInt(log2Ceil(beatBytes + 1).W)
}

class DMAPacketAssembler(beatBytes: Int) extends Module {
  val io = IO(new Bundle {
    val producer = new Bundle {
      val data = Flipped(Decoupled(UInt(8.W)))
      val done = Input(Bool()) // Signal to indicate we should send what we have and reset
    }
    val dmaOut = Decoupled(new DMAPacketAssemblerDMAOUTIO(beatBytes))
  })

  val counter = RegInit(0.U(log2Ceil(beatBytes + 1).W))
  val packedData = RegInit(0.U((8 * beatBytes).W))

  when (io.producer.data.fire) {
    packedData := packedData | (io.producer.data.bits << (counter << 3).asUInt).asUInt
    counter := counter + 1.U
  }

  when (io.dmaOut.fire) {
    packedData := 0.U
    counter := 0.U
  }

  io.dmaOut.valid := counter === beatBytes.U | (counter =/= 0.U & io.producer.done)
  io.dmaOut.bits.data := packedData
  io.dmaOut.bits.size := counter
  // If we are waiting on the out to be taken up, we should not take in more data
  io.producer.data.ready := !io.dmaOut.valid
}

/*
Builds one-byte wide data packets from the beatByte wide packets produced by the DMA
 */
class DMAPacketDisassembler(beatBytes: Int) extends Module {
  val io = IO(new Bundle {
    val dmaIn = Flipped(Decoupled(UInt((beatBytes*8).W)))
    val consumer = new Bundle {
      val data = Decoupled(UInt(8.W))
      val done = Input(Bool())
    }
  })

  val counter = RegInit(0.U(log2Ceil(beatBytes + 1).W))
  val wideData = RegInit(0.U((8 * beatBytes).W))

  when (io.dmaIn.fire) {
    wideData := io.dmaIn.bits
    counter := beatBytes.U
  }

  when (io.consumer.data.fire) {
    wideData := wideData >> 8
    counter := counter - 1.U
  }

  when (io.consumer.done) { // The assembler is done and we should reset to initial state
    wideData := 0.U
    counter := 0.U
  }

  io.dmaIn.ready := counter === 0.U & io.consumer.data.ready
  io.consumer.data.valid := counter =/= 0.U
  io.consumer.data.bits := wideData(7, 0)
}

class EE290CDMAWriteIO(addrBits: Int, beatBytes: Int) extends Bundle {
  val req = Flipped(Decoupled(new EE290CDMAWriterReq(addrBits, beatBytes)))
}

class EE290CDMAReadIO(addrBits: Int, beatBytes: Int, maxReadBytes: Int) extends Bundle {
  val req = Flipped(Decoupled(new EE290CDMAReaderReq(addrBits, maxReadBytes)))
  val resp = Decoupled(new EE290CDMAReaderResp(maxReadBytes))
  val queue = Decoupled(UInt((beatBytes * 8).W))
}


class EE290CDMA( val readDMANode : TLClientNode, val writeDMANode : TLClientNode, val beatBytes: Int, val maxReadBytes: Int, name: String)(implicit p: Parameters) extends LazyModule {
  //val id_node = TLIdentityNode()
  //val xbar_node = TLXbar()


  val reader = LazyModule(new EE290CDMAReader(readDMANode, beatBytes, maxReadBytes, s"${name}-reader"))
  val writer = LazyModule(new EE290CDMAWriter(writeDMANode, beatBytes, s"${name}-writer"))

  //xbar_node := writer.node
  //xbar_node := reader.node
  //id_node := xbar_node

  lazy val module = new EE290CDMAImp(this)
}

class EE290CDMAImp( outer : EE290CDMA ) extends LazyModuleImp( outer )
{
    val paddrBits       = 64 //TODO: is there an elegant way to get paddrBits into a non Tile based component
    val beatBytes       = outer.beatBytes
    val maxReadBytes    = outer.maxReadBytes
    
    val io = IO(new Bundle {
      val read = new EE290CDMAReadIO(paddrBits, beatBytes, maxReadBytes)
      val write = new EE290CDMAWriteIO(paddrBits, beatBytes)
      val readBusy = Output(Bool())
      val writeBusy = Output(Bool())
    })
    
    val data_length = 64
    val addr_length = 64
    
    val io_writeDMA = IO( new Bundle
    {
        val mem_a_valid         = Output( Bool() )
        val mem_a_bits_source   = Output( UInt( 16.W ) )
        val mem_a_bits_address  = Output( UInt( addr_length.W ) )
        val mem_a_bits_lgSize   = Output( UInt( log2Ceil(beatBytes+1).W ) )
        val mem_a_bits_data1    = Output( UInt( data_length.W ) )
        val mem_a_bits_data2    = Output( UInt( data_length.W ) )
        val mem_a_bits_mask     = Output( UInt( data_length.W ) )
        val select_cond         = Output( Bool() )
        val edge_done           = Input( Bool() )
        val mem_d_ready         = Output( Bool() )
        val mem_d_fire          = Input( Bool() )
    } )
    
    val io_readDMA = IO( new Bundle
    {
        val mem_a_valid         = Output( Bool() )
        val mem_a_bits_source   = Output( UInt( 16.W ) )
        val mem_a_bits_address  = Output( UInt( addr_length.W ) )
        val mem_a_bits_lgSize   = Output( UInt( log2Ceil(beatBytes+1).W ) )
        val edge_done           = Input( Bool() )
        val mem_d_ready         = Output( Bool() )
        val mem_d_fire          = Input( Bool() )
        val mem_d_bits_data     = Input( UInt( data_length.W ) )
    } )

    val readQ = Queue(outer.reader.module.io.queue) // Queue of read data
    val writeQ = Queue(io.write.req) // Queue of write requests

    io.read.queue <> readQ

    outer.reader.module.io.req <> io.read.req
    outer.reader.module.io.resp <> io.read.resp

    outer.writer.module.io.req <> writeQ
    
    io_writeDMA <> outer.writer.module.io_writeDMA
    io_readDMA  <> outer.reader.module.io_readDMA

    io.readBusy := outer.reader.module.io.busy
    io.writeBusy := outer.writer.module.io.busy
}

class EE290CDMAWriter( val node : TLClientNode, val beatBytes: Int, name: String)(implicit p: Parameters) extends LazyModule {
  //val node = TLHelper.makeClientNode(
  //  name = name,
  //  sourceId = IdRange(0, 1) // Identifies the valid IDs for this node. NOTE: Does not influence actual bundle creation (e.g. it's just a label)
  //)
  
  //val node = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
  //      name = name, sourceId = IdRange(0, 1))))))

  lazy val module = new EE290CDMAWriterImp( this )
}

class EE290CDMAWriterImp( outer: EE290CDMAWriter ) extends LazyModuleImp( outer ) with MemoryOpConstants
{
    val (mem, edge) = outer.node.out(0)
    
    val beatBytes = outer.beatBytes
    

    val paddrBits = edge.bundle.addressBits

    val io = IO(new Bundle {
      val req = Flipped(Decoupled(new EE290CDMAWriterReq(paddrBits, beatBytes)))
      val busy = Output(Bool())
    })
    
    val data_length = 64
    val addr_length = 64
    
    val io_writeDMA = IO( new Bundle
    {
        val mem_a_valid         = Output( Bool() )
        val mem_a_bits_source   = Output( UInt( 16.W ) )
        val mem_a_bits_address  = Output( UInt( addr_length.W ) )
        val mem_a_bits_lgSize   = Output( UInt( log2Ceil(beatBytes+1).W ) )
        val mem_a_bits_data1    = Output( UInt( data_length.W ) )
        val mem_a_bits_data2    = Output( UInt( data_length.W ) )
        val mem_a_bits_mask     = Output( UInt( data_length.W ) )
        val select_cond         = Output( Bool() )
        val edge_done           = Input( Bool() )
        val mem_d_ready         = Output( Bool() )
        val mem_d_fire          = Input( Bool() )
    } )

    val req = Reg(new EE290CDMAWriterReq(paddrBits, beatBytes))

    val s_idle :: s_write :: s_resp :: s_done :: Nil = Enum(4)
    val state = RegInit(s_idle)

    val mask = VecInit(Seq.tabulate(beatBytes)(i => ((1 << i) - 1).U ))

    val bytesSent = Reg(UInt(log2Ceil(beatBytes + 1).W))
    val bytesLeft = req.totalBytes - bytesSent

    io_writeDMA.mem_a_bits_source   := 0.U
    io_writeDMA.mem_a_bits_address  := req.addr
    io_writeDMA.mem_a_bits_lgSize   := log2Ceil(beatBytes).U
    
    io_writeDMA.mem_a_bits_data1    := req.data
    //val put = edge.Put(
    //  fromSource = 0.U, // TODO: Hardcoded to 0 for now, but will want to parameterize
    //  toAddress = req.addr,
    //  lgSize = log2Ceil(beatBytes).U,
    //  data = req.data)._2

    // Mask and data needs to be shifted by word offset (payload is little-endian and naturally aligned to word size)
    val shiftMask = (req.addr & (beatBytes - 1).U)(log2Ceil(beatBytes * 8), 0)
    val shiftData = (shiftMask << 3)(log2Ceil(beatBytes * 8), 0)
    
    io_writeDMA.mem_a_bits_data2    := (req.data << shiftData).asUInt
    io_writeDMA.mem_a_bits_mask     := (mask(bytesLeft) << shiftMask).asUInt
    
    //val putPartial = edge.Put(
    //  fromSource = 0.U,
    //  toAddress = req.addr,
    //  lgSize = log2Ceil(beatBytes).U,
    //  data = (req.data << shiftData).asUInt,
    //  mask = (mask(bytesLeft) << shiftMask).asUInt)._2

    io_writeDMA.mem_a_valid := state === s_write
    //mem.a.valid             := state === s_write
    io_writeDMA.select_cond := bytesLeft < beatBytes.U
    //mem.a.bits := Mux(bytesLeft < beatBytes.U, putPartial, put)

//    mem.d.ready := state === s_resp
    // TODO Both writer and reader needs to have mem.d.ready high for the xbar.d.ready to be high for some reason...
    //mem.d.ready             := true.B
    io_writeDMA.mem_d_ready := true.B

    //when (edge.done(mem.a)) {
    when( io_writeDMA.edge_done ) {
      req.addr  := req.addr + beatBytes.U
      bytesSent := bytesSent + Mux(bytesLeft < beatBytes.U, bytesLeft, beatBytes.U)
      state     := s_resp
    }

    //when (mem.d.fire) {
    when( io_writeDMA.mem_d_fire ) {
      state := Mux(bytesLeft === 0.U, s_done, s_write)
    }

    io.req.ready    := state === s_idle | state === s_done
    io.busy         := ~io.req.ready

    when (io.req.fire) {
      req       := io.req.bits
      bytesSent := 0.U
      state     := s_write
    }
}

class EE290CDMAReader(val node : TLClientNode, val beatBytes: Int, val maxReadBytes: Int, name: String)(implicit p: Parameters) extends LazyModule {
  //val node = TLHelper.makeClientNode(
  //  name = name,
  //  sourceId = IdRange(1, 2) // Identifies the valid IDs for this node. NOTE: Does not influence actual bundle creation (e.g. it's just a label)
  //)
  
  //val node = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
  //      name = name, sourceId = IdRange(1, 2))))))

  lazy val module = new EE290CDMAReaderImp( this )
}

class EE290CDMAReaderImp( outer : EE290CDMAReader ) extends LazyModuleImp(outer) with MemoryOpConstants {
    val (mem, edge) = outer.node.out(0)

    val paddrBits   = edge.bundle.addressBits
    
    val maxReadBytes    = outer.maxReadBytes
    val beatBytes       = outer.beatBytes

    val io = IO(new Bundle {
      val req = Flipped(Decoupled(new EE290CDMAReaderReq(paddrBits, maxReadBytes)))
      val resp = Decoupled(new EE290CDMAReaderResp(maxReadBytes))
      val queue = Decoupled(UInt((beatBytes * 8).W))
      val busy = Output(Bool())
    })
    
    val data_length = 64
    val addr_length = 64
    
    val io_readDMA = IO( new Bundle
    {
        val mem_a_valid         = Output( Bool() )
        val mem_a_bits_source   = Output( UInt( 16.W ) )
        val mem_a_bits_address  = Output( UInt( addr_length.W ) )
        val mem_a_bits_lgSize   = Output( UInt( log2Ceil(beatBytes+1).W ) )
        val edge_done           = Input( Bool() )
        val mem_d_ready         = Output( Bool() )
        val mem_d_fire          = Input( Bool() )
        val mem_d_bits_data     = Input( UInt( data_length.W ) )
    } )

    val req = Reg(new EE290CDMAReaderReq(paddrBits, maxReadBytes))

    val s_idle :: s_read :: s_resp :: s_queue :: s_done :: Nil = Enum(5)
    val state = RegInit(s_idle)

    val bytesRead = Reg(UInt(log2Ceil(maxReadBytes+1).W))
    val bytesLeft = req.totalBytes - bytesRead

    val dataBytes = Reg(UInt((beatBytes * 8).W))

    io_readDMA.mem_a_valid  := state === s_read
    //mem.a.valid             := state === s_read
    
    io_readDMA.mem_a_bits_source    := 1.U
    io_readDMA.mem_a_bits_address   := req.addr
    io_readDMA.mem_a_bits_lgSize    := log2Ceil(beatBytes).U
    
    //mem.a.bits := edge.Get(
    //  fromSource = 1.U, // TODO: Hardcoded to not conflict with writer, but should parameterize (as will be connected to bus)
    //  toAddress = req.addr,
    //  lgSize = log2Ceil(beatBytes).U)._2 // Always get a full beatBytes bytes, even if not used in packet

    
    //when (edge.done(mem.a)) {
    when (io_readDMA.edge_done) {
      req.addr := req.addr + beatBytes.U
      bytesRead := bytesRead + Mux(bytesLeft < beatBytes.U, bytesLeft, beatBytes.U) // TODO: move down to mem.d.fire clause to allow for masking (?)
      state := s_resp
    }

//    mem.d.ready := state === s_resp
    // TODO Both writer and reader needs to have mem.d.ready high for the xbar.d.ready to be high for some reason...
    io_readDMA.mem_d_ready  := true.B
    //mem.d.ready             := true.B

    //when (mem.d.fire) {
    when( io_readDMA.mem_d_fire ) {
      //dataBytes := mem.d.bits.data // TODO: mask off the unwanted bytes if bytesLeft < beatBytes.U using a mask vector and register
      dataBytes := io_readDMA.mem_d_bits_data
      state := s_queue
    }

    when (io.queue.fire && state === s_queue) {
      state := Mux(bytesLeft === 0.U, s_done, s_read)
    }

    io.req.ready := state === s_idle | state === s_done
    io.resp.valid := state === s_done
    io.resp.bits.bytesRead := bytesRead
    io.queue.valid := state === s_queue
    io.queue.bits := dataBytes
    io.busy := ~io.req.ready

    when (io.req.fire) {
      req := io.req.bits
      bytesRead := 0.U
      state := s_read
    }
}
