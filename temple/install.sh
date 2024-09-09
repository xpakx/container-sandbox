#!/usr/bin/env bash
qemu-system-x86_64 -display gtk,zoom-to-fit=on -enable-kvm -m 512 -cdrom ./TempleOS.ISO -hda ./temple.img -boot d
