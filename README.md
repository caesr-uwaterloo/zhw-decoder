# zhw-decoder
Investigating the implementation of ZFP's decoder for ASIC

The "decoder" and "sp21-dma" directories should be put in the "generators" directory in chipyard for reproducibility.

build.sbt should replace chipyard's default build.sbt at the top level.

The files under test_program should be put in the "tests" directory.

# Installation instructions for Siliconcompiler 

siliconcompiler:
```bash
pip install siliconcompiler
```

openroad:
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
cd OpenROAD
sudo ./etc/DependencyInstaller.sh
mkdir build && cd build
cmake ..
make
sudo make install

yosys dependencies:
sudo apt-get install build-essential clang bison flex \
libreadline-dev gawk tcl-dev libffi-dev git \
graphviz xdot pkg-config python3 libboost-system-dev \
libboost-python-dev libboost-filesystem-dev zlib1g-dev
 
yosys:
git clone --recursive https://github.com/YosysHQ/yosys.git
cd yosys
make config-gcc
make
sudo make install
 
klayout dependencies:
sudo apt install gcc g++ make \
qtbase5-dev qttools5-dev libqt5xmlpatterns5-dev qtmultimedia5-dev \
libqt5multimediawidgets5 libqt5svg5-dev ruby ruby-dev \
python3 python3-dev libz-dev libgit2-dev
 
klayout:
git clone https://github.com/KLayout/klayout.git
./build.sh
sudo echo "export PATH=$PATH:pathtogitrepo/klayout/bin-release" >> ~/.bashrc
sudo echo "export LD_LIBRARY_PATH=pathtogitrepo/klayout/bin-release" >> ~/.bashrc

Once this is done, just run 'python3 run.py' in either of the encoder or decoder siliconcompiler runs.

======================================================================================================

