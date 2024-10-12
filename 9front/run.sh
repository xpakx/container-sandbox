#!/usr/bin/env bash
qemu-system-x86_64 -cpu host -enable-kvm -m 512 -hda 9front.img -boot d \
   -net nic -net user,hostfwd=tcp::17060-:17060
