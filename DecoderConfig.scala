
package chipyard

import org.chipsalliance.cde.config.{Config}
//import freechips.rocketchip.subsystem.{MBUS}

class SmallBoomV3WithDecoderConfig extends Config(
  new decoder.WithDecoder(0x88000000L, 0x10000L) ++
  //new decoder.WithDecoder(0xe0000000L, 0x10000L) ++
  new boom.v3.common.WithNSmallBooms(1) ++                          // small boom config
  new freechips.rocketchip.subsystem.WithNMemoryChannels(2) ++ 
  //new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++  // add default external master port
  //new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ // add default external slave port
  //new testchipip.soc.WithOffchipBusClient(MBUS) ++           // OBUS provides backing memory to the MBUS
  //new testchipip.soc.WithOffchipBus ++                       // OBUS must exist for serial-tl to master off-chip memory
  //new testchipip.soc.WithMbusScratchpad( banks=2, partitions=2 ) ++
  //new freechips.rocketchip.subsystem.WithNBanks(4) ++
  new chipyard.config.AbstractConfig)

class MediumBoomV3WithDecoderConfig extends Config(
  new decoder.WithDecoder(0x88000000L, 0x10000L) ++
  //new decoder.WithDecoder(0xe0000000L, 0x10000L) ++
  new boom.v3.common.WithNMediumBooms(1) ++                         // medium boom config
  new freechips.rocketchip.subsystem.WithNMemoryChannels(2) ++ 
  //new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++  // add default external master port
  //new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ // add default external slave port
  //new testchipip.soc.WithOffchipBusClient(MBUS) ++           // OBUS provides backing memory to the MBUS
  //new testchipip.soc.WithOffchipBus ++                       // OBUS must exist for serial-tl to master off-chip memory
  //new testchipip.soc.WithMbusScratchpad( banks=2, partitions=2 ) ++
  //new freechips.rocketchip.subsystem.WithNBanks(4) ++
  new chipyard.config.AbstractConfig)

class LargeBoomV3WithDecoderConfig extends Config(
  new decoder.WithDecoder(0x88000000L, 0x10000L) ++
  //new decoder.WithDecoder(0xe0000000L, 0x10000L) ++
  new boom.v3.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new freechips.rocketchip.subsystem.WithNMemoryChannels(2) ++ 
  //new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++  // add default external master port
  //new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ // add default external slave port
  //new testchipip.soc.WithOffchipBusClient(MBUS) ++           // OBUS provides backing memory to the MBUS
  //new testchipip.soc.WithOffchipBus ++                       // OBUS must exist for serial-tl to master off-chip memory
  //new testchipip.soc.WithMbusScratchpad( banks=2, partitions=2 ) ++
  //new freechips.rocketchip.subsystem.WithNBanks(4) ++
  new chipyard.config.AbstractConfig)

class MegaBoomV3WithDecoderConfig extends Config(
  new decoder.WithDecoder(0x88000000L, 0x10000L) ++
  //new decoder.WithDecoder(0xe0000000L, 0x10000L) ++
  new boom.v3.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new freechips.rocketchip.subsystem.WithNMemoryChannels(2) ++ 
  //new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++  // add default external master port
  //new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ // add default external slave port
  //new testchipip.soc.WithOffchipBusClient(MBUS) ++           // OBUS provides backing memory to the MBUS
  //new testchipip.soc.WithOffchipBus ++                       // OBUS must exist for serial-tl to master off-chip memory
  //new testchipip.soc.WithMbusScratchpad( banks=2, partitions=2 ) ++
  //new freechips.rocketchip.subsystem.WithNBanks(4) ++
  new chipyard.config.AbstractConfig)

