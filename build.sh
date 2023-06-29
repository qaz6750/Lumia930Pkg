#!/bin/bash

git submodule init;git submodule update

pushd edk2
  git submodule init;git submodule update
popd

make -C edk2/BaseTools

export PACKAGES_PATH=$PWD/edk2:$PWD
export WORKSPACE=$PWD/workspace
export GCC5_ARM_PREFIX=$PWD/tools/gcc-linaro-5.5.0-2017.10-i686_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
. edk2/edksetup.sh

build -a ARM -p Lumia930Pkg/Lumia930.dsc -t GCC5 -j10 -s -n 0

$GCC5_ARM_PREFIX\objcopy -I binary -O elf32-littlearm --binary-architecture arm workspace/build/Lumia930-ARM/DEBUG_GCC5/FV/MSM8974_EFI.fd MSM8974_EFI.fd.elf  
$GCC5_ARM_PREFIX\ld MSM8974_EFI.fd.elf -T Lumia930Pkg/FvWrapper.ld -o emmc_appsboot.mbn
