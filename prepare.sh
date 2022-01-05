#!/bin/sh
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install libxtables-dev
sudo apt-get install libiptc-dev
sudo apt install lua5.1
sudo apt install liblua5.1-0-dev
sudo apt install libjson-c-dev

# Install  libubox
git clone git://git.openwrt.org/project/libubox.git
cd libubox
mkdir build
cd build
cmake ..
make
sudo make install
sudo cp /usr/local/lib/libubox.so /usr/lib/x86_64-linux-gnu/

# Install libubus
git clone git://git.openwrt.org/project/ubus.git
cd ubus
mkdir build
cd build
cmake ..
make
sudo make install
sudo cp /usr/local/lib/libubus.so /usr/lib/x86_64-linux-gnu/
