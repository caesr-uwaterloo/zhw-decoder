
mkdir hardware_results
mkdir software_results

make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder0.riscv > ./hardware_results/test_decoder0.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder1.riscv > ./hardware_results/test_decoder1.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder2.riscv > ./hardware_results/test_decoder2.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder3.riscv > ./hardware_results/test_decoder3.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder4.riscv > ./hardware_results/test_decoder4.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder5.riscv > ./hardware_results/test_decoder5.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder6.riscv > ./hardware_results/test_decoder6.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder7.riscv > ./hardware_results/test_decoder7.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder8.riscv > ./hardware_results/test_decoder8.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder9.riscv > ./hardware_results/test_decoder9.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder10.riscv > ./hardware_results/test_decoder10.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder11.riscv > ./hardware_results/test_decoder11.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder12.riscv > ./hardware_results/test_decoder12.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder13.riscv > ./hardware_results/test_decoder13.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder14.riscv > ./hardware_results/test_decoder14.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder15.riscv > ./hardware_results/test_decoder15.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder16.riscv > ./hardware_results/test_decoder16.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder17.riscv > ./hardware_results/test_decoder17.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder18.riscv > ./hardware_results/test_decoder18.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder19.riscv > ./hardware_results/test_decoder19.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder20.riscv > ./hardware_results/test_decoder20.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder21.riscv > ./hardware_results/test_decoder21.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder22.riscv > ./hardware_results/test_decoder22.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder23.riscv > ./hardware_results/test_decoder23.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder24.riscv > ./hardware_results/test_decoder24.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder25.riscv > ./hardware_results/test_decoder25.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder26.riscv > ./hardware_results/test_decoder26.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/test_decoder27.riscv > ./hardware_results/test_decoder27.txt &

make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/tests/zfp/bin/performance0 > ./software_results/performance0.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/tests/zfp/bin/performance1 > ./software_results/performance1.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/tests/zfp/bin/performance2 > ./software_results/performance2.txt &
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/tests/zfp/bin/performance3 > ./software_results/performance3.txt &

