
.PHONY: all
all: sync
	$(MAKE) $(MAKEOPTS) -C ./klipper
	cp ./klipper/out/klipper.bin ./klipper.bin

.PHONY: menuconfig
menuconfig: sync
	$(MAKE) $(MAKEOPTS) -C ./klipper menuconfig

.PHONY: clean
clean:
	$(MAKE) $(MAKEOPTS) -C ./klipper clean

.PHONY: sync
sync:
	git submodule update --init ../../external/klipper
	rsync -auv ../../external/klipper/* ./klipper
	rm -f ./klipper/.config
	ln -s ../config ./klipper/.config

.PHONY: flash
flash: all
	dfu-util -a 0 -D ./klipper.bin -s 0x08000000

