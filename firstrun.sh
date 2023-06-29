#!/bin/bash

pushd tools
  wget https://releases.linaro.org/components/toolchain/binaries/latest-5/arm-linux-gnueabihf/gcc-linaro-5.5.0-2017.10-i686_arm-linux-gnueabihf.tar.xz
  mv gcc-linaro-5.5.0-2017.10-i686_arm-linux-gnueabihf.tar.xz GCC5.tar.xz
  xz -d GCC5.tar.xz
  tar xvf GCC5.tar
popd
