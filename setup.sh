#!/bin/bash

sudo apt-get update
sudo apt-get install -y qemu-user-static live-build git build-essential tar bc

if [ ! $(which arm-linux-gnueabihf-gcc) ]; then
  wget https://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-linux-gnueabihf/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
  tar -xf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
  sudo cp -r gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf/* /
  sudo cp -r gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/* /
fi

sudo apt-get install -y flex bison imagemagick

git clone -b master https://github.com/atenart/dtc
make -C dtc && sudo make -C dtc install PREFIX=/usr
