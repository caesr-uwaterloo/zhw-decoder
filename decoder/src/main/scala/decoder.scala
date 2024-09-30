package decoder

import chisel3._
import chisel3.util._
import freechips.rocketchip.subsystem.{BaseSubsystem, CacheBlockBytes, FBUS}
import org.chipsalliance.cde.config.{Parameters, Field, Config}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.diplomacy.{TransferSizes}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.subsystem._
import ee290cdma._

case class DecoderConfig(base: BigInt, size: BigInt)

case object DecoderKey extends Field[Option[DecoderConfig]](None)

class Decoder( val beatBytes : Int, val maxReadBytes : Int )(implicit p: Parameters) extends LazyModule {
    //val node = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
    //    name = "decoder", sourceId = IdRange(0, 1))))))
    
    //val node2 = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
    //    name = "decoder2", sourceId = IdRange(1, 2) )))))
    
    //val node2 = TLManagerNode(Seq(TLSlavePortParameters.v1(
    //Seq(TLSlaveParameters.v1(
    //    address            = AddressSet.misaligned( BigInt( "90000000", 16 ), BigInt( "10000000", 16) ),
    //    resources          = new SimpleDevice("decoder_gets", Seq("decoder,get0")).reg("mem"),
    //    supportsGet        = TransferSizes(1, 8),
    //    fifoId             = Some(0))), // requests are handled in order
    //beatBytes = 8)))
  
    val config = p(DecoderKey).get
    
    //val beatBytes       = 8
    //val maxReadBytes    = 8*16
  
    //var base : BigInt = BigInt( "a000000", 16 )
    var base = 0xa000000
    //val (mem, edge) = node.out(0)
    // Note: it might complain here for unknown reasons
    val device  = new SimpleDevice( "decoder_regs", Seq( "decoder,regs0" ) )
    val regNode = TLRegisterNode(
        address = Seq(AddressSet( base, 0xfff) ),
        device  = device,
        beatBytes   = 8,
        concurrency = 1
    )
    
    val nodeReadDMA = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
        name = "readDMA", sourceId = IdRange(1, 2))))))
        
    val nodeWriteDMA = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
        name = "writeDMA", sourceId = IdRange(0, 1))))))
        
    val dummyNodeReadDMA = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
        name = "readDMA", sourceId = IdRange(2, 3))))))
        
    val dummyNodeWriteDMA = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLClientParameters(
        name = "writeDMA", sourceId = IdRange(3, 4))))))
        
    val xbarNodeRead = TLXbar()
    val xbarNodeWrite = TLXbar()
    
    val idNodeRead  = TLIdentityNode()
    val idNodeWrite = TLIdentityNode()
    
    xbarNodeRead    := dummyNodeWriteDMA
    xbarNodeRead    := nodeReadDMA
    idNodeRead      := xbarNodeRead
    
    xbarNodeWrite   := nodeWriteDMA
    xbarNodeWrite   := dummyNodeReadDMA
    idNodeWrite     := xbarNodeWrite
    
    lazy val readDMA        = LazyModule( new EE290CDMA( nodeReadDMA, dummyNodeWriteDMA, beatBytes, maxReadBytes, "readDMA" ) )
    lazy val writeDMA       = LazyModule( new EE290CDMA( dummyNodeReadDMA, nodeWriteDMA, beatBytes, maxReadBytes, "writeDMA" ) )
    
    //lazy val readDMAMod     = Module( readDMA.module )
    //lazy val writeDMAMod    = Module( writeDMA.module )
    
    //lazy val readDMAMod     = readDMA.module
    //lazy val writeDMAMod    = writeDMA.module

    lazy val module         = new DecoderModuleImp(this)
}

class DecoderIO extends Bundle
{
    //input wire [0:0] clk;
    val clk     = Input( Clock() )
    //input wire [0:0] reset;
    val reset   = Input( Bool() )
    //input wire [15:0] maxbits;
    val maxbits = Input( UInt( 16.W ) )
    //input wire [15:0] minbits;
    val minbits = Input( UInt( 16.W ) )
    //input wire [15:0] maxprec;
    val maxprec = Input( UInt( 16.W ) )
    //input wire signed [15:0] minexp;
    val minexp  = Input( SInt( 16.W ) )
    //input wire [63:0] s_bits_data_tdata;
    val s_bits_data_tdata   = Input( UInt( 64.W ) )
    //input wire [0:0] s_bits_data_tlast;
    val s_bits_data_tlast   = Input( Bool() )
    //input wire [0:0] s_bits_valid;
    val s_bits_valid        = Input( Bool() )
    //output wire [0:0] s_bits_ready;
    val s_bits_ready        = Output( Bool() )
    //output wire [51:0] m_stream_data_frac;
    val m_stream_data_frac  = Output( UInt( 52.W ) )
    //output wire [10:0] m_stream_data_expo;
    val m_stream_data_expo  = Output( UInt( 11.W ) )
    //output wire [0:0] m_stream_data_sign;
    val m_stream_data_sign  = Output( UInt( 1.W ) )
    //output wire [0:0] m_stream_valid;
    val m_stream_valid      = Output( Bool() )
    //input wire [0:0] m_stream_ready;
    val m_stream_ready      = Input( Bool() )
}

class DecoderV extends BlackBox with HasBlackBoxResource
{
    val io = IO(new DecoderIO)
    addResource( "/vsrc/decoder.v" )
}

class BadderDebug extends Module
{
    val io = IO(new Bundle
    {
        val maxbits               = Input( UInt( 16.W ) )
        val minbits               = Input( UInt( 16.W ) )
        val maxprec               = Input( UInt( 16.W ) )
        val minexp                = Input( SInt( 16.W ) )
  
        val s_bits_data_tdata     = Input( UInt( 64.W ) )
        val s_bits_data_tlast     = Input( Bool() )
        val s_bits_valid          = Input( Bool() )
        val s_bits_ready          = Output( Bool() )
  
        val m_stream_data_frac    = Output( UInt( 52.W ) )
        val m_stream_data_expo    = Output( UInt( 11.W ) )
        val m_stream_data_sign    = Output( UInt( 1.W ) )
  
        val m_stream_valid        = Output( Bool() )
        val m_stream_ready        = Input( Bool() )
    })
    
    val out         = Wire( UInt( 64.W ) )
    
    val useQueue    = 0
    
    if( useQueue == 2 )
    {
        val Qdepth          = 64
        val Q               = Module( new Queue( UInt( 64.W ), Qdepth ) )

        val counter             = RegInit( 0.U )
        val behaveErratically   = ( counter >> 3 ) === 1.U
        
        Q.io.enq.valid      := io.s_bits_valid
        Q.io.enq.bits       := io.s_bits_data_tdata
        io.s_bits_ready     := Q.io.enq.ready
        
        out                 := Q.io.deq.bits + 1.U
        io.m_stream_valid   := Q.io.deq.valid && behaveErratically
        Q.io.deq.ready      := io.m_stream_ready && behaveErratically
        
        counter             := (counter + 1.U) & 0xf.U
    }
    else if( useQueue == 1 )
    {
        val delayCycles     = 32
        val dataPipe        = RegInit( VecInit( Seq.fill( delayCycles )( 0.U(64.W) ) ) )
        val validPipe       = RegInit( VecInit( Seq.fill( delayCycles )( false.B ) ) )
        
        out                 := dataPipe(0)
        io.m_stream_valid   := validPipe(0)
        
        val willWriteOutData    = io.m_stream_ready || !validPipe(0)
        
        io.s_bits_ready     := !validPipe( delayCycles - 1 ) || willWriteOutData
        
        when( willWriteOutData )
        {
            for( i <- 0 until delayCycles-1 )
            {
                dataPipe(i)     := dataPipe(i+1)
                validPipe(i)    := validPipe(i+1)
            }
            dataPipe( delayCycles - 1 )     := io.s_bits_data_tdata + 1.U
            validPipe( delayCycles - 1 )    := io.s_bits_valid
        }
    }
    else
    {
        // make badder
        io.s_bits_ready         := io.m_stream_ready
        io.m_stream_valid       := io.s_bits_valid
        
        out                     := io.s_bits_data_tdata + 1.U
    }
    
    io.m_stream_data_sign   := out( 63 )
    io.m_stream_data_expo   := out( 62, 52 )
    io.m_stream_data_frac   := out( 51, 0 )
}

class ClockDivider( source_freq_mhz : Double, dest_freq_mhz : Double ) extends Module
{
    val io = IO( new Bundle
    {
        val clock_dest  = Output( Bool() )
        val pulse       = Output( Bool() )
    } )
    
    val count_until = ( source_freq_mhz / dest_freq_mhz * 0.5 ).ceil.toInt
    
    val state_size  = log2Ceil( count_until+1 )
    
    val counter_state   = RegInit( 0.U( state_size.W ) )
    val clock_state     = RegInit( false.B )
    
    val reached_limit_val   = ( counter_state === (count_until-1).U )
    val gen_pulse       = reached_limit_val
    
    clock_state         := clock_state ^ gen_pulse
    
    counter_state       := Mux( reached_limit_val, 0.U, counter_state+1.U )
    
    io.clock_dest       := clock_state
    io.pulse            := RegNext( gen_pulse ) & clock_state
}

class DecoderModuleImp(outer: Decoder) extends LazyModuleImp(outer) {
    val config = p(DecoderKey).get
    
    val (memWrite, edgeWrite) = outer.nodeWriteDMA.out(0)
    val (memRead, edgeRead) = outer.nodeReadDMA.out(0)
    
    val bytesPerDword       = 64/8
  
    // Section for handling memory mapped settings
    val maxbits             = RegInit( 0.U( 16.W ) ) //Wire( UInt( 16.W ) ) //RegInit( 0.U( 16.W ) )
    val minbits             = RegInit( 0.U( 16.W ) ) //Wire( UInt( 16.W ) ) //RegInit( 0.U( 16.W ) )
    val maxprec             = RegInit( 0.U( 16.W ) ) //Wire( UInt( 16.W ) ) //RegInit( 0.U( 16.W ) )
    val minexp              = RegInit( 0.U( 16.W ) ) //Wire( UInt( 16.W ) ) //RegInit( 0.U( 16.W ) )
  
    val numDwordsToRead     = RegInit( 0xffff.U( 32.W ) ) //Wire( UInt( 32.W ) ) //RegInit( 0.U( 32.W ) )
    val numDwordsToWrite    = RegInit( 0xffff.U( 32.W ) )
    val start               = RegInit( 0.U( 16.W ) ) //Wire( UInt( 16.W ) ) //RegInit( 0.U( 16.W ) )
    val done                = RegInit( 0.U( 16.W ) ) //Wire( UInt( 16.W ) ) //RegInit( 0.U( 16.W ) )
  
    val readAddress         = RegInit( 0.U( 64.W ) ) //Wire( UInt( 64.W ) ) //RegInit( 0.U( 64.W ) )
    val writeAddress        = RegInit( 0.U( 64.W ) ) //Wire( UInt( 64.W ) ) //RegInit( 0.U( 64.W ) )
    
    //val readAddress         = RegInit( 0x88000000L.U( 64.W ) ) //Wire( UInt( 64.W ) ) //RegInit( 0.U( 64.W ) )
    //val writeAddress        = RegInit( 0x88000000L.U( 64.W ) ) //Wire( UInt( 64.W ) ) //RegInit( 0.U( 64.W ) )
  
    val dummyReg            = RegInit( 1.U( 64.W ) )
    val indicatorReg        = RegInit( 0.U( 64.W ) )
    val indicatorReg2       = RegInit( 0.U( 64.W ) )
    
    //val dummyOutput         = RegInit( VecInit( Seq.fill( 64 )( 0x111.U(64.W) ) ) )
    //val dummyOutput2        = RegInit( VecInit( Seq.fill( 64 )( 0x222.U(64.W) ) ) )
    //val dummyOutput3        = RegInit( VecInit( Seq.fill( 64 )( 0x333.U(64.W) ) ) )
    //val dummyOutput4        = RegInit( VecInit( Seq.fill( 64 )( 0x444.U(64.W) ) ) )
    
    val in_queue_depth      = 0x100
    val in_queue            = Module( new Queue( UInt( 64.W ), in_queue_depth ) )
    
    val out_queue_depth     = 0x10
    val out_queue           = Module( new Queue( UInt( 64.W ), out_queue_depth ) )
    
    val permit_read_from_buffer = RegInit( true.B )
    
    indicatorReg            := Mux( indicatorReg < in_queue.io.count, in_queue.io.count, indicatorReg )
    indicatorReg2           := Mux( indicatorReg2 < out_queue.io.count, out_queue.io.count, indicatorReg2 )
    
    val clockDivider28MHz   = Module( new ClockDivider( 500.0, 27.963 ) )
    
    val clock_28MHz = Wire( Clock() )
    val pulse_28MHz = Wire( Bool() )
    
    clock_28MHz     := clockDivider28MHz.io.clock_dest.asClock
    pulse_28MHz     := clockDivider28MHz.io.pulse
    
    val timer_main  = RegInit( 0.U(64.W) )
    val timer_28MHz = RegInit( 0.U(64.W) )
    
    val count_number_of_writes  = RegInit( 0.U(64.W) )
    val done_writing_after_wDMA = count_number_of_writes >= numDwordsToWrite
    when( done_writing_after_wDMA )
    {
        count_number_of_writes  := 0.U
    }
    
    val count_decoder_ticks = RegInit( 0.U(64.W) )
    val count_rDMA_ticks    = RegInit( 0.U(64.W) )
    val count_wDMA_ticks    = RegInit( 0.U(64.W) )
    val count_system_ticks  = RegInit( 0.U(64.W) )
    
    val rDMA_active         = RegInit( false.B )
    val wDMA_active         = RegInit( false.B )
    val decoder_active      = RegInit( false.B )
    val system_active       = rDMA_active | wDMA_active | decoder_active
    
    when( decoder_active )
    {
        count_decoder_ticks := count_decoder_ticks + 1.U
    }
    when( rDMA_active )
    {
        count_rDMA_ticks    := count_rDMA_ticks + 1.U
    }
    when( wDMA_active )
    {
        count_wDMA_ticks    := count_wDMA_ticks + 1.U
    }
    when( system_active )
    {
        count_system_ticks  := count_system_ticks + 1.U
    }
    
    timer_main      := timer_main + 1.U
    when( pulse_28MHz )
    {
        timer_28MHz := timer_28MHz + 1.U
    }
    
    outer.regNode.regmap(
        0x00 -> Seq( RegField( 16, maxbits ) ),
        0x02 -> Seq( RegField( 16, minbits ) ),
        0x04 -> Seq( RegField( 16, maxprec ) ),
        0x06 -> Seq( RegField( 16, minexp ) ),
        0x08 -> Seq( RegField( 64, readAddress ) ),
        0x10 -> Seq( RegField( 64, writeAddress ) ),
        0x18 -> Seq( RegField( 32, numDwordsToRead ) ),
        0x1c -> Seq( RegField( 16, start ) ),
        0x1e -> Seq( RegField( 16, done ) ),
        0x20 -> Seq( RegField( 64, dummyReg ) ),
        0x28 -> Seq( RegField( 64, indicatorReg ) ),
        0x30 -> Seq( RegField( 64, indicatorReg2 ) ),
        0x38 -> Seq( RegField( 32, numDwordsToWrite ) ),
        0x40 -> Seq( RegField( 64, timer_main ) ),
        0x48 -> Seq( RegField( 64, timer_28MHz ) ),
        
        0x50 -> Seq( RegField( 64, count_decoder_ticks ) ),
        0x58 -> Seq( RegField( 64, count_rDMA_ticks ) ),
        0x60 -> Seq( RegField( 64, count_wDMA_ticks ) ),
        0x68 -> Seq( RegField( 64, count_system_ticks ) ),
        
        /*
        0x100 -> Seq( RegField( 64, dummyOutput(0) ) ),
        0x108 -> Seq( RegField( 64, dummyOutput(1) ) ),
        0x110 -> Seq( RegField( 64, dummyOutput(2) ) ),
        0x118 -> Seq( RegField( 64, dummyOutput(3) ) ),
        0x120 -> Seq( RegField( 64, dummyOutput(4) ) ),
        0x128 -> Seq( RegField( 64, dummyOutput(5) ) ),
        0x130 -> Seq( RegField( 64, dummyOutput(6) ) ),
        0x138 -> Seq( RegField( 64, dummyOutput(7) ) ),
        0x140 -> Seq( RegField( 64, dummyOutput(8) ) ),
        0x148 -> Seq( RegField( 64, dummyOutput(9) ) ),
        0x150 -> Seq( RegField( 64, dummyOutput(10) ) ),
        0x158 -> Seq( RegField( 64, dummyOutput(11) ) ),
        0x160 -> Seq( RegField( 64, dummyOutput(12) ) ),
        0x168 -> Seq( RegField( 64, dummyOutput(13) ) ),
        0x170 -> Seq( RegField( 64, dummyOutput(14) ) ),
        0x178 -> Seq( RegField( 64, dummyOutput(15) ) ),
        0x180 -> Seq( RegField( 64, dummyOutput(16) ) ),
        0x188 -> Seq( RegField( 64, dummyOutput(17) ) ),
        0x190 -> Seq( RegField( 64, dummyOutput(18) ) ),
        0x198 -> Seq( RegField( 64, dummyOutput(19) ) ),
        0x1a0 -> Seq( RegField( 64, dummyOutput(20) ) ),
        0x1a8 -> Seq( RegField( 64, dummyOutput(21) ) ),
        0x1b0 -> Seq( RegField( 64, dummyOutput(22) ) ),
        0x1b8 -> Seq( RegField( 64, dummyOutput(23) ) ),
        0x1c0 -> Seq( RegField( 64, dummyOutput(24) ) ),
        0x1c8 -> Seq( RegField( 64, dummyOutput(25) ) ),
        0x1d0 -> Seq( RegField( 64, dummyOutput(26) ) ),
        0x1d8 -> Seq( RegField( 64, dummyOutput(27) ) ),
        0x1e0 -> Seq( RegField( 64, dummyOutput(28) ) ),
        0x1e8 -> Seq( RegField( 64, dummyOutput(29) ) ),
        0x1f0 -> Seq( RegField( 64, dummyOutput(30) ) ),
        0x1f8 -> Seq( RegField( 64, dummyOutput(31) ) ),
        
        0x200 -> Seq( RegField( 64, dummyOutput(32) ) ),
        0x208 -> Seq( RegField( 64, dummyOutput(33) ) ),
        0x210 -> Seq( RegField( 64, dummyOutput(34) ) ),
        0x218 -> Seq( RegField( 64, dummyOutput(35) ) ),
        0x220 -> Seq( RegField( 64, dummyOutput(36) ) ),
        0x228 -> Seq( RegField( 64, dummyOutput(37) ) ),
        0x230 -> Seq( RegField( 64, dummyOutput(38) ) ),
        0x238 -> Seq( RegField( 64, dummyOutput(39) ) ),
        0x240 -> Seq( RegField( 64, dummyOutput(40) ) ),
        0x248 -> Seq( RegField( 64, dummyOutput(41) ) ),
        0x250 -> Seq( RegField( 64, dummyOutput(42) ) ),
        0x258 -> Seq( RegField( 64, dummyOutput(43) ) ),
        0x260 -> Seq( RegField( 64, dummyOutput(44) ) ),
        0x268 -> Seq( RegField( 64, dummyOutput(45) ) ),
        0x270 -> Seq( RegField( 64, dummyOutput(46) ) ),
        0x278 -> Seq( RegField( 64, dummyOutput(47) ) ),
        0x280 -> Seq( RegField( 64, dummyOutput(48) ) ),
        0x288 -> Seq( RegField( 64, dummyOutput(49) ) ),
        0x290 -> Seq( RegField( 64, dummyOutput(50) ) ),
        0x298 -> Seq( RegField( 64, dummyOutput(51) ) ),
        0x2a0 -> Seq( RegField( 64, dummyOutput(52) ) ),
        0x2a8 -> Seq( RegField( 64, dummyOutput(53) ) ),
        0x2b0 -> Seq( RegField( 64, dummyOutput(54) ) ),
        0x2b8 -> Seq( RegField( 64, dummyOutput(55) ) ),
        0x2c0 -> Seq( RegField( 64, dummyOutput(56) ) ),
        0x2c8 -> Seq( RegField( 64, dummyOutput(57) ) ),
        0x2d0 -> Seq( RegField( 64, dummyOutput(58) ) ),
        0x2d8 -> Seq( RegField( 64, dummyOutput(59) ) ),
        0x2e0 -> Seq( RegField( 64, dummyOutput(60) ) ),
        0x2e8 -> Seq( RegField( 64, dummyOutput(61) ) ),
        0x2f0 -> Seq( RegField( 64, dummyOutput(62) ) ),
        0x2f8 -> Seq( RegField( 64, dummyOutput(63) ) ),
        
        0x300 -> Seq( RegField( 64, dummyOutput2(0) ) ),
        0x308 -> Seq( RegField( 64, dummyOutput2(1) ) ),
        0x310 -> Seq( RegField( 64, dummyOutput2(2) ) ),
        0x318 -> Seq( RegField( 64, dummyOutput2(3) ) ),
        0x320 -> Seq( RegField( 64, dummyOutput2(4) ) ),
        0x328 -> Seq( RegField( 64, dummyOutput2(5) ) ),
        0x330 -> Seq( RegField( 64, dummyOutput2(6) ) ),
        0x338 -> Seq( RegField( 64, dummyOutput2(7) ) ),
        0x340 -> Seq( RegField( 64, dummyOutput2(8) ) ),
        0x348 -> Seq( RegField( 64, dummyOutput2(9) ) ),
        0x350 -> Seq( RegField( 64, dummyOutput2(10) ) ),
        0x358 -> Seq( RegField( 64, dummyOutput2(11) ) ),
        0x360 -> Seq( RegField( 64, dummyOutput2(12) ) ),
        0x368 -> Seq( RegField( 64, dummyOutput2(13) ) ),
        0x370 -> Seq( RegField( 64, dummyOutput2(14) ) ),
        0x378 -> Seq( RegField( 64, dummyOutput2(15) ) ),
        0x380 -> Seq( RegField( 64, dummyOutput2(16) ) ),
        0x388 -> Seq( RegField( 64, dummyOutput2(17) ) ),
        0x390 -> Seq( RegField( 64, dummyOutput2(18) ) ),
        0x398 -> Seq( RegField( 64, dummyOutput2(19) ) ),
        0x3a0 -> Seq( RegField( 64, dummyOutput2(20) ) ),
        0x3a8 -> Seq( RegField( 64, dummyOutput2(21) ) ),
        0x3b0 -> Seq( RegField( 64, dummyOutput2(22) ) ),
        0x3b8 -> Seq( RegField( 64, dummyOutput2(23) ) ),
        0x3c0 -> Seq( RegField( 64, dummyOutput2(24) ) ),
        0x3c8 -> Seq( RegField( 64, dummyOutput2(25) ) ),
        0x3d0 -> Seq( RegField( 64, dummyOutput2(26) ) ),
        0x3d8 -> Seq( RegField( 64, dummyOutput2(27) ) ),
        0x3e0 -> Seq( RegField( 64, dummyOutput2(28) ) ),
        0x3e8 -> Seq( RegField( 64, dummyOutput2(29) ) ),
        0x3f0 -> Seq( RegField( 64, dummyOutput2(30) ) ),
        0x3f8 -> Seq( RegField( 64, dummyOutput2(31) ) ),
        
        0x400 -> Seq( RegField( 64, dummyOutput2(32) ) ),
        0x408 -> Seq( RegField( 64, dummyOutput2(33) ) ),
        0x410 -> Seq( RegField( 64, dummyOutput2(34) ) ),
        0x418 -> Seq( RegField( 64, dummyOutput2(35) ) ),
        0x420 -> Seq( RegField( 64, dummyOutput2(36) ) ),
        0x428 -> Seq( RegField( 64, dummyOutput2(37) ) ),
        0x430 -> Seq( RegField( 64, dummyOutput2(38) ) ),
        0x438 -> Seq( RegField( 64, dummyOutput2(39) ) ),
        0x440 -> Seq( RegField( 64, dummyOutput2(40) ) ),
        0x448 -> Seq( RegField( 64, dummyOutput2(41) ) ),
        0x450 -> Seq( RegField( 64, dummyOutput2(42) ) ),
        0x458 -> Seq( RegField( 64, dummyOutput2(43) ) ),
        0x460 -> Seq( RegField( 64, dummyOutput2(44) ) ),
        0x468 -> Seq( RegField( 64, dummyOutput2(45) ) ),
        0x470 -> Seq( RegField( 64, dummyOutput2(46) ) ),
        0x478 -> Seq( RegField( 64, dummyOutput2(47) ) ),
        0x480 -> Seq( RegField( 64, dummyOutput2(48) ) ),
        0x488 -> Seq( RegField( 64, dummyOutput2(49) ) ),
        0x490 -> Seq( RegField( 64, dummyOutput2(50) ) ),
        0x498 -> Seq( RegField( 64, dummyOutput2(51) ) ),
        0x4a0 -> Seq( RegField( 64, dummyOutput2(52) ) ),
        0x4a8 -> Seq( RegField( 64, dummyOutput2(53) ) ),
        0x4b0 -> Seq( RegField( 64, dummyOutput2(54) ) ),
        0x4b8 -> Seq( RegField( 64, dummyOutput2(55) ) ),
        0x4c0 -> Seq( RegField( 64, dummyOutput2(56) ) ),
        0x4c8 -> Seq( RegField( 64, dummyOutput2(57) ) ),
        0x4d0 -> Seq( RegField( 64, dummyOutput2(58) ) ),
        0x4d8 -> Seq( RegField( 64, dummyOutput2(59) ) ),
        0x4e0 -> Seq( RegField( 64, dummyOutput2(60) ) ),
        0x4e8 -> Seq( RegField( 64, dummyOutput2(61) ) ),
        0x4f0 -> Seq( RegField( 64, dummyOutput2(62) ) ),
        0x4f8 -> Seq( RegField( 64, dummyOutput2(63) ) ),
        
        0x500 -> Seq( RegField( 64, dummyOutput3(0) ) ),
        0x508 -> Seq( RegField( 64, dummyOutput3(1) ) ),
        0x510 -> Seq( RegField( 64, dummyOutput3(2) ) ),
        0x518 -> Seq( RegField( 64, dummyOutput3(3) ) ),
        0x520 -> Seq( RegField( 64, dummyOutput3(4) ) ),
        0x528 -> Seq( RegField( 64, dummyOutput3(5) ) ),
        0x530 -> Seq( RegField( 64, dummyOutput3(6) ) ),
        0x538 -> Seq( RegField( 64, dummyOutput3(7) ) ),
        0x540 -> Seq( RegField( 64, dummyOutput3(8) ) ),
        0x548 -> Seq( RegField( 64, dummyOutput3(9) ) ),
        0x550 -> Seq( RegField( 64, dummyOutput3(10) ) ),
        0x558 -> Seq( RegField( 64, dummyOutput3(11) ) ),
        0x560 -> Seq( RegField( 64, dummyOutput3(12) ) ),
        0x568 -> Seq( RegField( 64, dummyOutput3(13) ) ),
        0x570 -> Seq( RegField( 64, dummyOutput3(14) ) ),
        0x578 -> Seq( RegField( 64, dummyOutput3(15) ) ),
        0x580 -> Seq( RegField( 64, dummyOutput3(16) ) ),
        0x588 -> Seq( RegField( 64, dummyOutput3(17) ) ),
        0x590 -> Seq( RegField( 64, dummyOutput3(18) ) ),
        0x598 -> Seq( RegField( 64, dummyOutput3(19) ) ),
        0x5a0 -> Seq( RegField( 64, dummyOutput3(20) ) ),
        0x5a8 -> Seq( RegField( 64, dummyOutput3(21) ) ),
        0x5b0 -> Seq( RegField( 64, dummyOutput3(22) ) ),
        0x5b8 -> Seq( RegField( 64, dummyOutput3(23) ) ),
        0x5c0 -> Seq( RegField( 64, dummyOutput3(24) ) ),
        0x5c8 -> Seq( RegField( 64, dummyOutput3(25) ) ),
        0x5d0 -> Seq( RegField( 64, dummyOutput3(26) ) ),
        0x5d8 -> Seq( RegField( 64, dummyOutput3(27) ) ),
        0x5e0 -> Seq( RegField( 64, dummyOutput3(28) ) ),
        0x5e8 -> Seq( RegField( 64, dummyOutput3(29) ) ),
        0x5f0 -> Seq( RegField( 64, dummyOutput3(30) ) ),
        0x5f8 -> Seq( RegField( 64, dummyOutput3(31) ) ),
        
        0x600 -> Seq( RegField( 64, dummyOutput3(32) ) ),
        0x608 -> Seq( RegField( 64, dummyOutput3(33) ) ),
        0x610 -> Seq( RegField( 64, dummyOutput3(34) ) ),
        0x618 -> Seq( RegField( 64, dummyOutput3(35) ) ),
        0x620 -> Seq( RegField( 64, dummyOutput3(36) ) ),
        0x628 -> Seq( RegField( 64, dummyOutput3(37) ) ),
        0x630 -> Seq( RegField( 64, dummyOutput3(38) ) ),
        0x638 -> Seq( RegField( 64, dummyOutput3(39) ) ),
        0x640 -> Seq( RegField( 64, dummyOutput3(40) ) ),
        0x648 -> Seq( RegField( 64, dummyOutput3(41) ) ),
        0x650 -> Seq( RegField( 64, dummyOutput3(42) ) ),
        0x658 -> Seq( RegField( 64, dummyOutput3(43) ) ),
        0x660 -> Seq( RegField( 64, dummyOutput3(44) ) ),
        0x668 -> Seq( RegField( 64, dummyOutput3(45) ) ),
        0x670 -> Seq( RegField( 64, dummyOutput3(46) ) ),
        0x678 -> Seq( RegField( 64, dummyOutput3(47) ) ),
        0x680 -> Seq( RegField( 64, dummyOutput3(48) ) ),
        0x688 -> Seq( RegField( 64, dummyOutput3(49) ) ),
        0x690 -> Seq( RegField( 64, dummyOutput3(50) ) ),
        0x698 -> Seq( RegField( 64, dummyOutput3(51) ) ),
        0x6a0 -> Seq( RegField( 64, dummyOutput3(52) ) ),
        0x6a8 -> Seq( RegField( 64, dummyOutput3(53) ) ),
        0x6b0 -> Seq( RegField( 64, dummyOutput3(54) ) ),
        0x6b8 -> Seq( RegField( 64, dummyOutput3(55) ) ),
        0x6c0 -> Seq( RegField( 64, dummyOutput3(56) ) ),
        0x6c8 -> Seq( RegField( 64, dummyOutput3(57) ) ),
        0x6d0 -> Seq( RegField( 64, dummyOutput3(58) ) ),
        0x6d8 -> Seq( RegField( 64, dummyOutput3(59) ) ),
        0x6e0 -> Seq( RegField( 64, dummyOutput3(60) ) ),
        0x6e8 -> Seq( RegField( 64, dummyOutput3(61) ) ),
        0x6f0 -> Seq( RegField( 64, dummyOutput3(62) ) ),
        0x6f8 -> Seq( RegField( 64, dummyOutput3(63) ) ),
        
        0x700 -> Seq( RegField( 64, dummyOutput4(0) ) ),
        0x708 -> Seq( RegField( 64, dummyOutput4(1) ) ),
        0x710 -> Seq( RegField( 64, dummyOutput4(2) ) ),
        0x718 -> Seq( RegField( 64, dummyOutput4(3) ) ),
        0x720 -> Seq( RegField( 64, dummyOutput4(4) ) ),
        0x728 -> Seq( RegField( 64, dummyOutput4(5) ) ),
        0x730 -> Seq( RegField( 64, dummyOutput4(6) ) ),
        0x738 -> Seq( RegField( 64, dummyOutput4(7) ) ),
        0x740 -> Seq( RegField( 64, dummyOutput4(8) ) ),
        0x748 -> Seq( RegField( 64, dummyOutput4(9) ) ),
        0x750 -> Seq( RegField( 64, dummyOutput4(10) ) ),
        0x758 -> Seq( RegField( 64, dummyOutput4(11) ) ),
        0x760 -> Seq( RegField( 64, dummyOutput4(12) ) ),
        0x768 -> Seq( RegField( 64, dummyOutput4(13) ) ),
        0x770 -> Seq( RegField( 64, dummyOutput4(14) ) ),
        0x778 -> Seq( RegField( 64, dummyOutput4(15) ) ),
        0x780 -> Seq( RegField( 64, dummyOutput4(16) ) ),
        0x788 -> Seq( RegField( 64, dummyOutput4(17) ) ),
        0x790 -> Seq( RegField( 64, dummyOutput4(18) ) ),
        0x798 -> Seq( RegField( 64, dummyOutput4(19) ) ),
        0x7a0 -> Seq( RegField( 64, dummyOutput4(20) ) ),
        0x7a8 -> Seq( RegField( 64, dummyOutput4(21) ) ),
        0x7b0 -> Seq( RegField( 64, dummyOutput4(22) ) ),
        0x7b8 -> Seq( RegField( 64, dummyOutput4(23) ) ),
        0x7c0 -> Seq( RegField( 64, dummyOutput4(24) ) ),
        0x7c8 -> Seq( RegField( 64, dummyOutput4(25) ) ),
        0x7d0 -> Seq( RegField( 64, dummyOutput4(26) ) ),
        0x7d8 -> Seq( RegField( 64, dummyOutput4(27) ) ),
        0x7e0 -> Seq( RegField( 64, dummyOutput4(28) ) ),
        0x7e8 -> Seq( RegField( 64, dummyOutput4(29) ) ),
        0x7f0 -> Seq( RegField( 64, dummyOutput4(30) ) ),
        0x7f8 -> Seq( RegField( 64, dummyOutput4(31) ) ),
        
        0x800 -> Seq( RegField( 64, dummyOutput4(32) ) ),
        0x808 -> Seq( RegField( 64, dummyOutput4(33) ) ),
        0x810 -> Seq( RegField( 64, dummyOutput4(34) ) ),
        0x818 -> Seq( RegField( 64, dummyOutput4(35) ) ),
        0x820 -> Seq( RegField( 64, dummyOutput4(36) ) ),
        0x828 -> Seq( RegField( 64, dummyOutput4(37) ) ),
        0x830 -> Seq( RegField( 64, dummyOutput4(38) ) ),
        0x838 -> Seq( RegField( 64, dummyOutput4(39) ) ),
        0x840 -> Seq( RegField( 64, dummyOutput4(40) ) ),
        0x848 -> Seq( RegField( 64, dummyOutput4(41) ) ),
        0x850 -> Seq( RegField( 64, dummyOutput4(42) ) ),
        0x858 -> Seq( RegField( 64, dummyOutput4(43) ) ),
        0x860 -> Seq( RegField( 64, dummyOutput4(44) ) ),
        0x868 -> Seq( RegField( 64, dummyOutput4(45) ) ),
        0x870 -> Seq( RegField( 64, dummyOutput4(46) ) ),
        0x878 -> Seq( RegField( 64, dummyOutput4(47) ) ),
        0x880 -> Seq( RegField( 64, dummyOutput4(48) ) ),
        0x888 -> Seq( RegField( 64, dummyOutput4(49) ) ),
        0x890 -> Seq( RegField( 64, dummyOutput4(50) ) ),
        0x898 -> Seq( RegField( 64, dummyOutput4(51) ) ),
        0x8a0 -> Seq( RegField( 64, dummyOutput4(52) ) ),
        0x8a8 -> Seq( RegField( 64, dummyOutput4(53) ) ),
        0x8b0 -> Seq( RegField( 64, dummyOutput4(54) ) ),
        0x8b8 -> Seq( RegField( 64, dummyOutput4(55) ) ),
        0x8c0 -> Seq( RegField( 64, dummyOutput4(56) ) ),
        0x8c8 -> Seq( RegField( 64, dummyOutput4(57) ) ),
        0x8d0 -> Seq( RegField( 64, dummyOutput4(58) ) ),
        0x8d8 -> Seq( RegField( 64, dummyOutput4(59) ) ),
        0x8e0 -> Seq( RegField( 64, dummyOutput4(60) ) ),
        0x8e8 -> Seq( RegField( 64, dummyOutput4(61) ) ),
        0x8f0 -> Seq( RegField( 64, dummyOutput4(62) ) ),
        0x8f8 -> Seq( RegField( 64, dummyOutput4(63) ) )
        */
    )
    
    // Section for handling decoder
  
    val s_bits_data_tdata   = Wire( UInt( 64.W ) )
    val s_bits_data_tlast   = Wire( Bool() )
    val s_bits_valid        = Wire( Bool() )
    val s_bits_ready        = Wire( Bool() )
  
    val m_stream_data_frac  = Wire( UInt( 52.W ) )
    val m_stream_data_expo  = Wire( UInt( 11.W ) )
    val m_stream_data_sign  = Wire( UInt( 1.W ) )
  
    val m_stream_data       = Wire( UInt( 64.W ) )
    m_stream_data           := m_stream_data_sign ## m_stream_data_expo ## m_stream_data_frac
  
    val m_stream_valid      = Wire( Bool() )
    val m_stream_ready      = Wire( Bool() )
    
    val countNumReads       = RegInit( 0.U(64.W) )
    val readIter            = Reg( UInt( 32.W ) )
    
    val countNumWrites      = RegInit( 0.U(64.W) )
    val writeIter           = Reg( UInt( 32.W ) )

    val useBadder = false
    if( useBadder )
    {
        val badder = withClock( clock_28MHz ) { Module( new BadderDebug ) }
        
        val resetCounter        = RegInit( 36.U(8.W) )
        
        val manualReset         = Wire( Bool() )
        manualReset             := ( start === 0.U )
        val longReset           = Reg( Bool() )
        longReset               := manualReset | longReset
        val longerReset         = Reg( Bool() )
        when( pulse_28MHz )
        {
            longerReset         := longReset
            longReset           := manualReset
        }
        
        val desireableReset     = longReset | longerReset
        
        resetCounter            := Mux( resetCounter > 0.U, resetCounter-1.U, 0.U )
        
        badder.io.maxbits               := maxbits
        badder.io.minbits               := minbits
        badder.io.maxprec               := maxprec
        badder.io.minexp                := minexp.asSInt
        
        badder.io.s_bits_data_tdata     := s_bits_data_tdata
        badder.io.s_bits_data_tlast     := s_bits_data_tlast
        badder.io.s_bits_valid          := s_bits_valid
        s_bits_ready                    := badder.io.s_bits_ready && desireableReset
        
        m_stream_data_frac              := badder.io.m_stream_data_frac
        m_stream_data_expo              := badder.io.m_stream_data_expo
        m_stream_data_sign              := badder.io.m_stream_data_sign
        
        m_stream_valid                  := badder.io.m_stream_valid
        badder.io.m_stream_ready        := m_stream_ready
        
        
        badder.io.maxbits               := maxbits
        badder.io.minbits               := minbits
        badder.io.maxprec               := maxprec
        badder.io.minexp                := minexp.asSInt
        
        badder.io.s_bits_data_tdata     := s_bits_data_tdata
        badder.io.s_bits_data_tlast     := s_bits_data_tlast
        badder.io.s_bits_valid          := s_bits_valid
        s_bits_ready                    := badder.io.s_bits_ready && pulse_28MHz && desireableReset
        
        m_stream_data_frac              := badder.io.m_stream_data_frac
        m_stream_data_expo              := badder.io.m_stream_data_expo
        m_stream_data_sign              := badder.io.m_stream_data_sign
        
        //m_stream_valid                      := realDecoder.io.m_stream_valid && pulse_28MHz
        //realDecoder.io.m_stream_ready       := m_stream_ready
        
        out_queue.io.enq.valid              := badder.io.m_stream_valid && pulse_28MHz && desireableReset
        out_queue.io.enq.bits               := badder.io.m_stream_data_sign ## badder.io.m_stream_data_expo ## badder.io.m_stream_data_frac
        badder.io.m_stream_ready            := out_queue.io.enq.ready || true.B // KEEP THIS ASSERTED. IT CANNOT HANDLE BACKPRESSURE WELL. YOU WILL HAVE A HEADACHE FOR A WEEK WHILE YOU FIGURE THIS OUT AGAIN.
        
        m_stream_data_frac                  := out_queue.io.deq.bits(51,0)
        m_stream_data_expo                  := out_queue.io.deq.bits(62,52)
        m_stream_data_sign                  := out_queue.io.deq.bits(63)
        
        m_stream_valid                      := out_queue.io.deq.valid
        out_queue.io.deq.ready              := m_stream_ready
        
        when( badder.io.s_bits_ready && badder.io.s_bits_valid && pulse_28MHz )
        {
            //dummyOutput(readIter)   := badder.io.s_bits_data_tdata
            //dummyOutput2(readIter)  := countNumReads

            readIter        := readIter + 1.U
            countNumReads   := countNumReads + 1.U
        }
    
        when( badder.io.m_stream_valid && badder.io.m_stream_ready && pulse_28MHz )
        {
            //when(countNumWrites < 0x40.U)
            //{
            //    dummyOutput3(countNumWrites)    := in_queue.io.deq.bits  //( badder.io.m_stream_data_sign << 63 ) | ( badder.io.m_stream_data_expo << 52 ) | badder.io.m_stream_data_frac
            //}
            //.otherwise
            //{
            //    dummyOutput4(countNumWrites-0x40.U)    := in_queue.io.deq.bits // ( badder.io.m_stream_data_sign << 63 ) | ( badder.io.m_stream_data_expo << 52 ) | badder.io.m_stream_data_frac
            //}
        
            writeIter                   := writeIter + 1.U
            countNumWrites              := countNumWrites + 1.U
        }
        
    }
    else // the real thing
    {
        val realDecoder = Module( new DecoderV )
        
        val manualReset         = Wire( Bool() )
        manualReset             := ( start === 0.U )
        val longReset           = Reg( Bool() )
        val longerReset         = Reg( Bool() )
        
        when( !manualReset )
        {
            count_decoder_ticks := 0.U
            count_rDMA_ticks    := 0.U
            count_wDMA_ticks    := 0.U
            count_system_ticks  := 0.U
        }
        
        when( pulse_28MHz )
        {
            longerReset         := longReset
            longReset           := manualReset
        }
        .elsewhen( !manualReset )
        {
            longReset           := manualReset
        }
        
        val desireableReset     = Wire( Bool() )
        desireableReset         := longReset & longerReset
        
        withClockAndReset(clock, reset)
        {
            realDecoder.io.clk      := clock_28MHz //clock
            realDecoder.io.reset    := !reset.asBool && desireableReset
        }
        
        realDecoder.io.maxbits              := maxbits
        realDecoder.io.minbits              := minbits
        realDecoder.io.maxprec              := maxprec
        realDecoder.io.minexp               := minexp.asSInt
        
        realDecoder.io.s_bits_data_tdata    := s_bits_data_tdata
        realDecoder.io.s_bits_data_tlast    := s_bits_data_tlast
        realDecoder.io.s_bits_valid         := s_bits_valid && desireableReset
        s_bits_ready                        := realDecoder.io.s_bits_ready && pulse_28MHz && desireableReset
        
        m_stream_data_frac                  := realDecoder.io.m_stream_data_frac
        m_stream_data_expo                  := realDecoder.io.m_stream_data_expo
        m_stream_data_sign                  := realDecoder.io.m_stream_data_sign
        
        //m_stream_valid                      := realDecoder.io.m_stream_valid && pulse_28MHz
        //realDecoder.io.m_stream_ready       := m_stream_ready
        
        out_queue.io.enq.valid              := realDecoder.io.m_stream_valid && pulse_28MHz && desireableReset
        out_queue.io.enq.bits               := realDecoder.io.m_stream_data_sign ## realDecoder.io.m_stream_data_expo ## realDecoder.io.m_stream_data_frac
        realDecoder.io.m_stream_ready       := out_queue.io.enq.ready || true.B // KEEP THIS ASSERTED. IT CANNOT HANDLE BACKPRESSURE WELL. YOU WILL HAVE A HEADACHE FOR A WEEK WHILE YOU FIGURE THIS OUT AGAIN.
        
        m_stream_data_frac                  := out_queue.io.deq.bits(51,0)
        m_stream_data_expo                  := out_queue.io.deq.bits(62,52)
        m_stream_data_sign                  := out_queue.io.deq.bits(63)
        
        m_stream_valid                      := out_queue.io.deq.valid
        out_queue.io.deq.ready              := m_stream_ready
        
        val flags               = pulse_28MHz | ( desireableReset << 1 ) | ( clock_28MHz.asBool.asUInt << 2 ) | ( realDecoder.io.m_stream_ready << 3 ) | ( realDecoder.io.m_stream_valid << 4 ) | ( realDecoder.io.s_bits_ready << 5 ) | ( realDecoder.io.s_bits_valid << 6 ) | ( out_queue.io.enq.ready << 7 ) | ( out_queue.io.enq.valid << 8 ) | ( in_queue.io.deq.ready << 9 ) | ( in_queue.io.deq.valid << 10 )
        
        when( realDecoder.io.s_bits_ready && realDecoder.io.s_bits_valid && pulse_28MHz && desireableReset )
        //when( realDecoder.io.s_bits_ready && realDecoder.io.s_bits_valid )
        {
            //dummyOutput(readIter)   := realDecoder.io.s_bits_data_tdata // flags //realDecoder.io.s_bits_data_tdata
            //dummyOutput2(readIter)  := countNumReads // in_queue.io.deq.bits //countNumReads

            readIter        := readIter + 1.U
            countNumReads   := countNumReads + 1.U
        }
    
        when( !desireableReset )
        {
            writeIter           := 0.U
        }
    
        when( realDecoder.io.m_stream_valid && realDecoder.io.m_stream_ready && pulse_28MHz && desireableReset )
        //when( realDecoder.io.m_stream_valid && realDecoder.io.m_stream_ready )
        {
            //when(countNumWrites < 0x40.U)
            //{
            //    dummyOutput3(countNumWrites)    := ( realDecoder.io.m_stream_data_sign << 63 ) | ( realDecoder.io.m_stream_data_expo << 52 ) | realDecoder.io.m_stream_data_frac // flags //( realDecoder.io.m_stream_data_sign << 63 ) | ( realDecoder.io.m_stream_data_expo << 52 ) | realDecoder.io.m_stream_data_frac
            //}
            //.otherwise
            //{
            //    dummyOutput4(countNumWrites-0x40.U)    := ( realDecoder.io.m_stream_data_sign << 63 ) | ( realDecoder.io.m_stream_data_expo << 52 ) | realDecoder.io.m_stream_data_frac // flags //( realDecoder.io.m_stream_data_sign << 63 ) | ( realDecoder.io.m_stream_data_expo << 52 ) | realDecoder.io.m_stream_data_frac
            //}
        
            writeIter                   := writeIter + 1.U
            countNumWrites              := countNumWrites + 1.U
        }
    }

    // Section to handle DMAs
    
    
    val paddrBits   = 64
    
    // Ones that stay as 0
    val readDMA_io_write_req_valid              = RegInit( false.B )
    val readDMA_io_write_req_bits_addr          = RegInit( 0.U(64.W) )
    val readDMA_io_write_req_bits_data          = RegInit( 0.U )
    val readDMA_io_write_req_bits_totalBytes    = RegInit( 0.U )
    
    val writeDMA_io_read_req_valid              = RegInit( false.B )
    val writeDMA_io_read_req_bits_addr          = RegInit( 0.U(64.W) )
    val writeDMA_io_read_req_bits_totalBytes    = RegInit( 0.U )
    val writeDMA_io_read_resp_ready             = RegInit( false.B )
    val writeDMA_io_read_queue_ready            = RegInit( false.B )
    
    // Ones we want to control
    val readDMA_io_read_req_valid               = Wire( Bool() ) //RegInit( false.B )
    val readDMA_io_read_req_bits_addr           = Wire( UInt( 64.W ) ) //RegInit( 0.U(64.W) )
    val readDMA_io_read_req_bits_totalBytes     = Wire( UInt( 32.W ) ) //RegInit( 0.U )
    val readDMA_io_read_resp_ready              = Wire( Bool() ) //RegInit( false.B )
    val readDMA_io_read_queue_ready             = Wire( Bool() ) //RegInit( false.B )
    
    val writeDMA_io_write_req_valid             = Wire( Bool() )
    val writeDMA_io_write_req_bits_addr         = Wire( UInt( 64.W ) )
    val writeDMA_io_write_req_bits_data         = Wire( UInt( 64.W ) )
    val writeDMA_io_write_req_bits_totalBytes   = Wire( UInt( 32.W ) )
    
    // Things we want to observe
    val readDMA_io_read_req_ready               = Wire( Bool() )
    val readDMA_io_read_resp_valid              = Wire( Bool() )
    val readDMA_io_read_resp_bits_bytesRead     = Wire( UInt((log2Ceil(outer.maxReadBytes+1)).W) )
    val readDMA_io_read_queue_valid             = Wire( Bool() )
    val readDMA_io_read_queue_bits              = Wire( UInt((outer.beatBytes*8).W) )
    
    val writeDMA_io_write_req_ready             = Wire( Bool() )
    
    val readDMA     = Module( outer.readDMA.module )
    val writeDMA    = Module( outer.writeDMA.module )
    
    // Write the zeros
    readDMA.io.write.req.valid              := readDMA_io_write_req_valid
    readDMA.io.write.req.bits.addr          := readDMA_io_write_req_bits_addr
    readDMA.io.write.req.bits.data          := readDMA_io_write_req_bits_data
    readDMA.io.write.req.bits.totalBytes    := readDMA_io_write_req_bits_totalBytes
    
    writeDMA.io.read.req.valid              := writeDMA_io_read_req_valid
    writeDMA.io.read.req.bits.addr          := writeDMA_io_read_req_bits_addr
    writeDMA.io.read.req.bits.totalBytes    := writeDMA_io_read_req_bits_totalBytes
    writeDMA.io.read.resp.ready             := writeDMA_io_read_resp_ready
    writeDMA.io.read.queue.ready            := writeDMA_io_read_queue_ready
    
    // Write the control inputs
    readDMA.io.read.req.valid               := readDMA_io_read_req_valid
    readDMA.io.read.req.bits.addr           := readDMA_io_read_req_bits_addr
    readDMA.io.read.req.bits.totalBytes     := readDMA_io_read_req_bits_totalBytes
    readDMA.io.read.resp.ready              := readDMA_io_read_resp_ready
    readDMA.io.read.queue.ready             := readDMA_io_read_queue_ready
    
    writeDMA.io.write.req.valid             := writeDMA_io_write_req_valid
    writeDMA.io.write.req.bits.addr         := writeDMA_io_write_req_bits_addr
    writeDMA.io.write.req.bits.data         := writeDMA_io_write_req_bits_data
    writeDMA.io.write.req.bits.totalBytes   := writeDMA_io_write_req_bits_totalBytes
    
    readDMA_io_read_req_ready               := readDMA.io.read.req.ready
    readDMA_io_read_resp_valid              := readDMA.io.read.resp.valid
    readDMA_io_read_resp_bits_bytesRead     := readDMA.io.read.resp.bits.bytesRead
    readDMA_io_read_queue_valid             := readDMA.io.read.queue.valid
    readDMA_io_read_queue_bits              := readDMA.io.read.queue.bits
    
    writeDMA_io_write_req_ready             := writeDMA.io.write.req.ready
    
    val put = edgeWrite.Put(
        fromSource  = writeDMA.io_writeDMA.mem_a_bits_source, // TODO: Hardcoded to 0 for now, but will want to parameterize
        toAddress   = writeDMA.io_writeDMA.mem_a_bits_address,
        lgSize      = writeDMA.io_writeDMA.mem_a_bits_lgSize,
        data        = writeDMA.io_writeDMA.mem_a_bits_data1 )._2
    
    val putPartial = edgeWrite.Put(
        fromSource  = writeDMA.io_writeDMA.mem_a_bits_source,
        toAddress   = writeDMA.io_writeDMA.mem_a_bits_address,
        lgSize      = writeDMA.io_writeDMA.mem_a_bits_lgSize,
        data        = writeDMA.io_writeDMA.mem_a_bits_data2,
        mask        = writeDMA.io_writeDMA.mem_a_bits_mask)._2
    
    memWrite.a.valid    := writeDMA.io_writeDMA.mem_a_valid
    memWrite.a.bits     := Mux(writeDMA.io_writeDMA.select_cond, putPartial, put)
    
    memWrite.d.ready    := writeDMA.io_writeDMA.mem_d_ready
    
    writeDMA.io_writeDMA.edge_done  := edgeWrite.done(memWrite.a)
    writeDMA.io_writeDMA.mem_d_fire := memWrite.d.fire
    
    when( memWrite.d.fire )
    {
        count_number_of_writes  := count_number_of_writes + 1.U
    }
    
    readDMA.io_writeDMA.edge_done   := false.B
    readDMA.io_writeDMA.mem_d_fire  := false.B
    
    memRead.a.valid := readDMA.io_readDMA.mem_a_valid
    memRead.a.bits  := edgeRead.Get(
        fromSource  = readDMA.io_readDMA.mem_a_bits_source, // TODO: Hardcoded to not conflict with writer, but should parameterize (as will be connected to bus)
        toAddress   = readDMA.io_readDMA.mem_a_bits_address,
        lgSize      = readDMA.io_readDMA.mem_a_bits_lgSize)._2 // Always get a full beatBytes bytes, even if not used in packet
    
    readDMA.io_readDMA.edge_done        := edgeRead.done(memRead.a)
    memRead.d.ready                     := readDMA.io_readDMA.mem_d_ready
    readDMA.io_readDMA.mem_d_fire       := memRead.d.fire
    readDMA.io_readDMA.mem_d_bits_data  := memRead.d.bits.data
    
    // TODO: double check that these are fine
    writeDMA.io_readDMA.edge_done       := false.B
    writeDMA.io_readDMA.mem_d_fire      := false.B
    writeDMA.io_readDMA.mem_d_bits_data := 0.U
    
    // Section to handle wiring between components
    
    val writeIP             = RegInit( false.B )
    val qdepth              = 8
    val writeSettingsQueue  = Module( new Queue( Vec( 2, UInt( 64.W ) ), qdepth ) )
    val writeNumDwordsQ     = RegInit( 0xffff.U(32.W) )
    val writeAddrQ          = RegInit( 0x0.U(64.W) )
    //val writeAddrQ          = RegInit( 0x80002f00L.U(64.W) )
    
    val countNumReadReqs    = RegInit( 0.U(64.W) )
    val countNumWriteReqs   = RegInit( 0.U(64.W) )
    
    val readDone            = readIter  >= numDwordsToRead
    val writeDone           = writeIter >= writeNumDwordsQ
    
    val canStartNewRequest  = ( start =/= 0.U ) && readDMA_io_read_req_ready
    
    readDMA_io_read_req_valid               := canStartNewRequest
    readDMA_io_read_req_bits_addr           := readAddress
    readDMA_io_read_req_bits_totalBytes     := numDwordsToRead*bytesPerDword.U
    readDMA_io_read_resp_ready              := true.B
    readDMA_io_read_queue_ready             := true.B
    
    writeDMA_io_write_req_bits_addr         := writeAddrQ
    writeDMA_io_write_req_valid             := m_stream_valid
    writeDMA_io_write_req_bits_data         := m_stream_data
    writeDMA_io_write_req_bits_totalBytes   := bytesPerDword.U
    m_stream_ready                          := writeDMA_io_write_req_ready 

    when( m_stream_ready && m_stream_valid )
    {
        writeAddrQ      := writeAddrQ + 8.U
    }
    
    writeSettingsQueue.io.deq.ready := !writeIP
    
    val numYoinksFromQueue = RegInit( 0.U( 64.W ) )
    
    when( !writeIP && writeSettingsQueue.io.deq.valid )
    {
        writeAddrQ      := writeSettingsQueue.io.deq.bits(0)
        writeNumDwordsQ := writeSettingsQueue.io.deq.bits(1)
        writeIP         := true.B
        
        numYoinksFromQueue  := numYoinksFromQueue + 1.U
    }

    
    val observeReset    = Wire( Bool() )
    withClockAndReset( clock, reset )
    {
        observeReset    := reset.asBool
    }
    
    val rvrwDecoderFlags    = m_stream_valid | ( m_stream_ready << 1.U ) | ( s_bits_valid << 2.U ) | ( s_bits_ready << 3.U )
    val otherFlags          = writeIP | ( canStartNewRequest << 1.U ) | ( observeReset << 2.U )
    
    //indicatorReg    := start
    //indicatorReg    := writeAddrQ
    //indicatorReg    := maxbits | ( minbits << 16.U ) | ( maxprec << 32.U ) | ( minexp << 48.U )
    //indicatorReg2   := ( numDwordsToRead << 32.U ) | ( readIter << 24.U ) | ( otherFlags << 20.U ) | ( rvrwDecoderFlags << 16.U ) | ( writeNumDwordsQ << 8.U ) | writeIter
    
    indicatorReg    := writeAddrQ
    indicatorReg2   := writeNumDwordsQ | ( writeIter << 32 )
    
    when( readDone )
    {
        readIter            := 0.U
        countNumReadReqs    := countNumReadReqs + 1.U
    }
    
    when( writeDone )
    {
        writeIter           := 0.U
        done                := done + 1.U
        writeIP             := false.B
        countNumWriteReqs   := countNumWriteReqs + 1.U
    }
    
    // Assume that ready is always asserted
    writeSettingsQueue.io.enq.valid     := canStartNewRequest && readDMA_io_read_req_valid
    writeSettingsQueue.io.enq.bits(0)   := writeAddress
    writeSettingsQueue.io.enq.bits(1)   := numDwordsToWrite
    
    // if there is a request to start another
    // and the read DMA is ready for another request
    // then start a new request
    when( canStartNewRequest )
    {
        dummyReg    := dummyReg << 1.U
        start       := 0.U
    }
    
    s_bits_valid                := in_queue.io.deq.valid && permit_read_from_buffer
    s_bits_data_tdata           := in_queue.io.deq.bits
    in_queue.io.deq.ready       := s_bits_ready && permit_read_from_buffer
    
    in_queue.io.enq.valid       := readDMA_io_read_queue_valid
    in_queue.io.enq.bits        := readDMA_io_read_queue_bits
    readDMA_io_read_queue_ready := in_queue.io.enq.ready
    
    val counter_pre             = RegNext( readIter )
    s_bits_data_tlast           := ( (counter_pre % 16.U) === 0.U)
    
    //val rDMA_active         = RegInit( false.B )
    //val wDMA_active         = RegInit( false.B )
    //val decoder_active      = RegInit( false.B )
    
    when( canStartNewRequest )
    {
        rDMA_active         := true.B
    }
    .elsewhen( readDone )
    {
        rDMA_active         := false.B
    }
    
    when( s_bits_valid )
    {
        wDMA_active         := true.B
    }
    .elsewhen( done_writing_after_wDMA )
    {
        wDMA_active         := false.B
    }
    
    when( readDMA_io_read_queue_valid )
    {
        decoder_active      := true.B
    }
    .elsewhen( writeDone )
    {
        decoder_active      := false.B
    }
    
    //indicatorReg    := countNumReads | (observeReset << 8) | ( countNumReadReqs << 9 ) | ( numDwordsToRead << 48 )
    //indicatorReg2   := countNumWrites | ( countNumWriteReqs << 20 ) | ( writeNumDwordsQ << 48 ) | ( numYoinksFromQueue << 56 )
}

trait CanHavePeripheryDecoder{ this: BaseSubsystem =>
    implicit val p: Parameters

    p(DecoderKey) .map { k =>
        val fbus = locateTLBusWrapper(FBUS)
        val mbus = locateTLBusWrapper(MBUS)
        val pbus = locateTLBusWrapper(PBUS)
        val sbus = locateTLBusWrapper(SBUS)

        val maxReadBytes = (8*16)*8
        
        val decoder = pbus{ fbus{ LazyModule(new Decoder( fbus.beatBytes, maxReadBytes )(p)) } }

        fbus.coupleFrom( "readDMA" ) { _ :*= decoder.idNodeRead }
        fbus.coupleFrom( "writeDMA" ) { _ :*= decoder.idNodeWrite }

        pbus.coupleTo("decoder_regs") { decoder.regNode := TLFragmenter(pbus.beatBytes, pbus.blockBytes) := _ }

    }
}

class WithDecoder(base: BigInt, size: BigInt) extends Config((site, here, up) => {
    case DecoderKey => Some(DecoderConfig(base, size))
})

