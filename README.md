# zhw-decoder
Investigating the implementation of ZFP's decoder for ASIC

# Requirements

These instructions have been tested on a Linux (Ubuntu) distribution.  They should work on other distributions and OSX, but we have not tried it yet.

# Documentation

1. [Installation instructions for Siliconcompiler](docs/install-siliconcompiler.md)
2. [Installation instructions for Chipyard using Docker](docs/install-docker-chipyard.md) 

# Generating GDSII for the ZHW decoder

Please follow the installation instructions for Siliconcompiler.

The "decoder" and "sp21-dma" directories should be put in the "generators" directory in chipyard for reproducibility.

build.sbt should replace chipyard's default build.sbt at the top level.

The files under test_program should be put in the "tests" directory.

# Running ZFP (software) version on the RISCV BOOM core in Chipyard

Please follow the installation instructions for Chipyard.

The [ZFP](https://github.com/LLNL/zfp) compression library needs to be compiled with the RISCV toolchain, and there are a few changes that must be done in order for it to work on the BOOM core.

Make a directory
```bash
mkdir chipyard && cd chipyard
```

Pull the Docker container for Chipyard
```bash
docker pull rseac/chipyard-docker
```

Clone the ZFP repository 
```bash
git clone 
```

* Run the container in interactive mode while mapping the ZFP repository into the container 
```bash
docker run -it -v ./zfp:/zfp rseac/chipyard-docker
```

* Source `env.sh` to correctly populate all the paths for the tools
```bash
source /chipyard/env.sh
```

* TODO: Edit `src/Makefile` and make the following changes
** Change the archival to static library `ar rc` to `ar rcs ...`
** Change the `.c.o` target to `-fno-common -fno-builtin-printf -specs=htif_nano.specs -march=rv64imafd -mabi=lp64d -mcmodel=medany`

* TODO: Edit `Confg` and make the following changes
** Change `CC` to `riscv64-unknown-elf-gcc` and `CXX` to `riscv64-unknown-elf-g++` 
** Change `FLAGS` to `FLAGS = $(OPTFLAGS)` and `LDFLAGS` to `-static -specs=htif_nano.specs`

* TODO: Edit `tests/testzfp.cpp` and add `extern "C" void *__dso_handle = 0;` at the top of the file after the includes.

* TODO: Edit `tests/testviews.cpp` and add `extern "C" void *__dso_handle = 0;` at the top of the file after the includes.

* Run `make`
```bash
make
```

* Make sure Veirlator is compiled
```
cd /chipyard/sims/verilator
make

```
* Run `testzfp` on the BOOM core
```bash
make run-binary /zfp/bin/testzfp LOADMEM=1
```
