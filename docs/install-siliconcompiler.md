# Installation instructions for Siliconcompiler 

Use `pip` to install Siliconcompiler

```bash
pip install siliconcompiler
```

## Installing OpenRoad
```bash
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
cd OpenROAD
sudo ./etc/DependencyInstaller.sh
mkdir build && cd build
cmake ..
make
sudo make install
```

## Installing Yosys, klayout and their dependencies

First we install the dependencies.
```bash
sudo apt-get install build-essential clang bison flex \
libreadline-dev gawk tcl-dev libffi-dev git \
graphviz xdot pkg-config python3 libboost-system-dev \
libboost-python-dev libboost-filesystem-dev zlib1g-dev
```

Next we install Yosys.

```bash
git clone --recursive https://github.com/YosysHQ/yosys.git
cd yosys
make config-gcc
make
sudo make install
```

Followed by klayout dependencies

```bash
sudo apt install gcc g++ make \
qtbase5-dev qttools5-dev libqt5xmlpatterns5-dev qtmultimedia5-dev \
libqt5multimediawidgets5 libqt5svg5-dev ruby ruby-dev \
python3 python3-dev libz-dev libgit2-dev
```
Install klayout

```bash
git clone https://github.com/KLayout/klayout.git
./build.sh
sudo echo "export PATH=$PATH:pathtogitrepo/klayout/bin-release" >> ~/.bashrc
sudo echo "export LD_LIBRARY_PATH=pathtogitrepo/klayout/bin-release" >> ~/.bashrc
```

# Run the encoder or decoder

Once this is done, just run 'python3 run.py' in either of the encoder or decoder siliconcompiler runs.

```bash
python3 run.py
```
