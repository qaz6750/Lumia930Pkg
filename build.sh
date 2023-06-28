#!/bin/bash

##export PACKAGES_PATH=$PWD/edk2:$PWD
##export WORKSPACE=$PWD/workspace
##export GCC5_ARM_PREFIX=$PWD/GCC5/bin/arm-linux-gnueabihf-
##. edk2/edksetup.sh

## build -a ARM -p Lumia930Pkg/Lumia930.dsc -t GCC5 -j10 -s -n 0

$GCC5_ARM_PREFIX\objcopy -I binary -O elf32-littlearm --binary-architecture arm workspace/build/Lumia930-ARM/DEBUG_GCC5/FV/MSM8974_EFI.fd MSM8974_EFI.fd.elf  
$GCC5_ARM_PREFIX\ld MSM8974_EFI.fd.elf -T Lumia930Pkg/FvWrapper.ld -o emmc_appsboot.mbn
