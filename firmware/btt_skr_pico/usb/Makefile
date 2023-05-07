
include ../../common/klipper.mk

final     = klipper.uf2
copydir   ?= $(mountdir)/RPI-RP2

.PHONY: flash
flash:
	@if [ ! -d "$(copydir)" ]; then \
	    $(call ansierr,\033[31;1mflash dir doesn't exist: $(copydir)\033[0m,); \
	    exit 1; \
	fi
	cp ./$(_final) $(copydir)/$(final)

