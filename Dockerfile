FROM rseac/chipyard-docker as base
ARG CHECKOUT_HASH=1.13.0

FROM base as stage0
RUN apt update
RUN apt install -y make cmake

FROM stage0 as stage1
WORKDIR /chipyard/tests/
RUN git clone https://github.com/LLNL/zfp.git
WORKDIR /chipyard/tests/zfp/
RUN git checkout da9a8349ab200890b169b90ecde2b8a6a6fc6de8

FROM stage1 as stage2
RUN mkdir /zhw_decoder/
WORKDIR /zhw_decoder/
# RUN git clone https://github.com/caesr-uwaterloo/zhw-decoder.git # This can be uncommented once released

