include ../common/klipper.mk

.PHONY: flash
flash: klipper.bin
	dfu-util -a 0 -D klipper.bin -s 0x08000000:leave -d 0483:df11

