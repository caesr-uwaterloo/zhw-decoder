
source move_things_correctly.sh

cd /chipyard/
source env.sh

cd /chipyard/tests/
cmake CMakeLists.txt
make -j15 >/dev/null

cd ./zfp/
make -j15 >/dev/null
cd ./examples/
make -j15 >/dev/null

cd /chipyard/sims/verilator/
make run-binary -j15 CONFIG=SmallBoomV3WithDecoderConfig LOADMEM=1 BINARY=/chipyard/hello.riscv

