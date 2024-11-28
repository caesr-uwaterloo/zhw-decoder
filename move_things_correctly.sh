#!/bin/bash

# yes | cp -rf ./zfp_files/... /chipyard/tests/zfp/...

yes | cp -rf ./build.sbt /chipyard/
yes | cp -rf ./decoder/ /chipyard/generators/
yes | cp -rf ./sp21-dma/ /chipyard/generators/

# Copy zfp tests
yes | cp -rf ./zfp_files/Config /chipyard/tests/zfp
yes | cp -rf ./zfp_files/examplesMakefile /chipyard/tests/zfp/examples/Makefile
yes | cp -rf ./zfp_files/performance0.c /chipyard/tests/zfp/examples/
yes | cp -rf ./zfp_files/performance1.c /chipyard/tests/zfp/examples/
yes | cp -rf ./zfp_files/performance2.c /chipyard/tests/zfp/examples/
yes | cp -rf ./zfp_files/performance3.c /chipyard/tests/zfp/examples/
yes | cp -rf ./zfp_files/srcMakefile /chipyard/tests/zfp/src/Makefile



# Copy zhw tests
yes | cp -rf ./test_program/test_decoder.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder.h /chipyard/tests/
yes | cp -rf ./test_program/tvs.h /chipyard/tests/
#yes | cp -rf ./test_program/Makefile /chipyard/tests/

yes | cp -rf ./test_program/test_decoder0.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder1.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder2.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder3.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder4.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder5.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder6.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder7.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder8.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder9.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder10.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder11.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder12.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder13.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder14.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder15.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder16.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder17.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder18.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder19.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder20.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder21.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder22.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder23.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder24.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder25.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder26.c /chipyard/tests/
yes | cp -rf ./test_program/test_decoder27.c /chipyard/tests/

