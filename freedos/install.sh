#!/usr/bin/env bash
qemu-system-x86_64 -boot d -cdrom ./freedos.iso -hda ./freedos.img -m 512
