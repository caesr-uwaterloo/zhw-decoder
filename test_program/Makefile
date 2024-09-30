#################################
# RISCV Toolchain
#################################

TARGET = riscv64-unknown-elf

GCC = $(TARGET)-gcc
CXX = $(TARGET)-g++
CP = $(TARGET)-objcopy
OBJDUMP = $(TARGET)-objdump
DG = $(TARGET)-gdb
SIZE = $(TARGET)-size


#################################
# Flags
#################################

# SoC Settings
ARCH = rv64imafdc
ABI = lp64d
ARCHFLAGS = -march=$(ARCH) -mabi=$(ABI)

CFLAGS  = -std=gnu99 -O2 -fno-common -fno-builtin-printf -Wall
CFLAGS += $(ARCHFLAGS)
LDFLAGS = -static

include libgloss.mk

PROGRAMS = pwm blkdev accum charcount nic-loopback big-blkdev pingd \
           streaming-passthrough streaming-fir nvdla spiflashread spiflashwrite fft gcd \
           hello mt-hello symmetric \
           test_decoder0 \
           test_decoder1 \
           test_decoder2 \
           test_decoder3 \
           test_decoder4 \
           test_decoder5 \
           test_decoder6 \
           test_decoder7 \
           test_decoder8 \
           test_decoder9 \
           test_decoder10 \
           test_decoder11 \
           test_decoder12 \
           test_decoder13 \
           test_decoder14 \
           test_decoder15 \
           test_decoder16 \
           test_decoder17 \
           test_decoder18 \
           test_decoder19 \
           test_decoder20 \
           test_decoder21 \
           test_decoder22 \
           test_decoder23 \
           test_decoder24 \
           test_decoder25 \
           test_decoder26 \
           test_decoder27 


.DEFAULT_GOAL := default


#################################
# Build
#################################

spiflash.img: spiflash.py
	python3 $<

%.o: %.S
	$(GCC) $(CFLAGS) -D__ASSEMBLY__=1 -c $< -o $@

%.o: %.c mmio.h spiflash.h
	$(GCC) $(CFLAGS) -c $< -o $@

%.riscv: %.o $(libgloss)
	$(GCC) $(LDFLAGS) $< -o $@

%.dump: %.riscv
	$(OBJDUMP) -D $< > $@


#################################
# Recipes
#################################

.PHONY: clean
clean:
	rm -f *.riscv *.o *.dump
	$(if $(libgloss),rm -rf $(libgloss_builddir)/)

.PHONY: default
default: $(addsuffix .riscv, $(PROGRAMS)) spiflash.img

.PHONY: dumps
dumps: $(addsuffix .dump, $(PROGRAMS))
