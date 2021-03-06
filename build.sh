#!/bin/bash

if [[ $(grep "tar \${LIVE_IMAGE_NAME}-\${LIVE_IMAGE_ARCHITECTURE}." /usr/lib/live/build/binary_tar) ]]; then
        sudo sed -s -i 's%tar ${LIVE_IMAGE_NAME}-${LIVE_IMAGE_ARCHITECTURE}.%tar binary%' /usr/lib/live/build/binary_tar
fi

sudo lb build && RC=1
if [[ $RC -eq 1 ]]; then
  rm -rf live-image-armhf.tar.tar
  pushd binary
  sudo tar -cf ../rootfs.tar .
  popd

  CHIP_UBOOT_BRANCH=${CHIP_UBOOT_BRANCH:-production-mlc}

  git clone https://github.com/nextthingco/chip-u-boot
  pushd chip-u-boot

  git checkout ${CHIP_UBOOT_BRANCH}

  make ${UBOOT_EXTRA_OPTS} ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- CHIP_defconfig
  make ${UBOOT_EXTRA_OPTS} ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

  popd

  tar -cf chip-u-boot.tar chip-u-boot
else
  echo "FAILED"
fi
