#!/bin/sh

CHROOT_DIR=/opt/ltsp/i386

chroot $CHROOT_DIR mount -t proc /proc /proc
chroot $CHROOT_DIR apt-get update
chroot $CHROOT_DIR env LTSP_HANDLE_DAEMONS=false apt-get dist-upgrade
umount /opt/ltsp/i386/proc
ltsp-update-kernels -b /opt/ltsp -d ltsp
ltsp-update-image -p 2000 -b /opt/ltsp -a i386
