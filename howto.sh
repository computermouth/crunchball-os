#!/bin/bash

lb config\
 --apt-indices none\
 --apt-recommends false\
 --architectures armhf\
 --binary-images tar\
 --binary-filesystem ext3\
 --bootloader ""\
 --cache false\
 --chroot-filesystem none\
 --debian-installer-gui false\
 --distribution jessie\
 --parent-distribution jessie\
 --parent-debian-installer-distribution jessie\
 --gzip-options '--best --rsyncable'\
 --initramfs auto\
 --linux-flavours ntc-mlc\
 --linux-packages linux-image-4.4.13\
 --bootstrap-qemu-arch armhf\
 --bootstrap-qemu-static /usr/bin/qemu-arm-static

