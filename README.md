# zhw-decoder
Investigating the implementation of ZFP's decoder for ASIC

# Requirements

These instructions have been tested on a Linux (Ubuntu) distribution.  They should work on other distributions and OSX, but we have not tried it yet.

# Documentation

1. [Installation instructions for Siliconcompiler](docs/install-siliconcompiler.md)
2. [Installation instructions for Chipyard using Docker](docs/install-docker-chipyard.md)

# Quick Setup
Pull the docker container
```bash
docker pull themichaelgionet/zhw_container
```
Or build it locally if you want
```bash
docker build -t zhw_container .
```
It is expected to take a long time to build. 

Start the container in one terminal
```bash
docker run -it themichaelgionet/zhw_container bash
```

Copy over this repo into the docker container, or pull it into the container
```bash
# Copy
docker cp . [docker process id]:/zhw_decoder
```

```bash
# Pull
git clone https://github.com/caesr-uwaterloo/zhw-decoder.git
```

Now just run the automated setup within the docker container:
```bash
source initial_setup.sh
```
Don't worry if you see some errors when it gets to making the zfp examples, those are for tests that are not relevant for this. After that completes, you are ready to use the tools.

# Running ZHW decoder in Chipyard 

The quick start procedure should have everything setup. Navigate to the "sims/verilator" directory
```bash
cd /chipyard/sims/verilator/
```

All tests (hardware and software) can be run at once with a script that is included. For that, just do:
```bash
source run_tests.sh
```
It is setup to run those tests as background processes. The results of those tests should be in "./hardware_results/" and "./software_results/". 

The "rate" setting by default is rate 16 (maxbits=0x100). To change it in hardware, navigate to "/chipyard/tests/"
```bash
cd /chipyard/tests/
```

Now, modify the test_decoder.c program to include the new rate. The maxbits and minbits to use are computed as "minbits=maxbits=0x10*rate". This should be on lines 148,149.
```bash
vim ./test_decoder.c
```

Next, clean the directory and rebuild.
```
make clean
cmake CMakeList.txt clean
cmake CMakeList.txt
make -j16
```

Navigate back to the simulation directory and rerun tests
```bash
cd /chipyard/sims/verilator/
source run_tests.sh
```

You could also comment out the print statements for the output values, in lines 197 to 206 of test_decoder.c to run the sim faster. Unlike the software version, the print statements here do not affect the timing results (they don't affect it too much, that is).

# Running ZFP (software) version on the RISCV BOOM core in Chipyard

Running the software version uses the same script as the hardware version. Once the repo is setup, just do this from /chipyard/sims/verilator/
```bash
source run_tests.sh
```

The results should be in the new ./software_results/ directory. 
NOTE: by default, the software version does not print the results to the screen. Printing values to the screen does heavily impact performance, but allows the user to verify the results as a tradeoff. To change this, go to the zfp examples directory
```bash
cd /chipyard/tests/zfp/examples/
```

Next, in all of performance0.c, performance1.c, performance2.c, performance3.c, uncomment lines 214 to 218 inclusive. 
```bash
vim ./performance0.c
vim ./performance1.c
vim ./performance2.c
vim ./performance3.c
```

Rebuild
```bash
make clean
make -j16
```

Go back to the verilator simulation directory and rerun
```bash
cd /chipyard/sims/verilator/
source run_tests.sh
```
