default: all

# figure out where things we need live
reporoot ?= $(shell git rev-parse --show-toplevel)
common   ?= $(reporoot)/firmware/common
external ?= $(reporoot)/external
patches  ?= $(reporoot)/patches
# and make them available to subprocesses
MAKEOPTS := $(MAKEOPTS) reporoot=$(reporoot) \
                        common=$(common) \
                        external=$(external) \
                        patches=$(patches)

# we need these to provide functionality we use as we go
include $(common)/platform.mk
include $(common)/utility.mk

# on macos, we need some extra flags because clang is awesome~~~
ifeq ($(hostos),Darwin)
MAKEOPTS += CPP="clang -E" CXXFLAGS="-std=c++11"
endif

# these are our defaults, but can be overridden by any specific firmware build
final    ?= klipper.bin
config   ?= config
source   ?= klipper
upstream ?= $(external)/klipper

# default is build the firmware and nothing else
.PHONY: all
all: $(final)

# this is the full/real build
$(final): ./$(config)
	$(MAKE) $(MAKEOPTS) $(MAKEFLAGS) -C ./$(source)
	cp ./$(source)/out/$(final) ./$(_final)

# standard menuconfig for klipper; shouldn't be necessary most of the time
.PHONY: menuconfig
menuconfig ./$(config): | ./$(source)
	$(MAKE) $(MAKEOPTS) $(MAKEFLAGS) -C ./$(source) menuconfig

# clean-up, clean-up, everybody clean-up...
.PHONY: clean
clean:
	$(MAKE) $(MAKEOPTS) $(MAKEFLAGS) -C ./$(source) clean

# this updates our copy of the klipper source from the upstream given
.PHONY: sync
sync ./$(source): $(external)/klipper
	git submodule update --init $(upstream)
	rsync -auv $(upstream)/* ./$(source)
	cd ./$(source); \
	  patch -Np1 -i $(patches)/klipper_add_elf2uf2_cxxflags.patch; \
	  patch -Np1 -i $(patches)/klipper_fix_readelf_macos.patch
	rm -f ./$(source)/.config
	ln -s ../$(config) ./$(source)/.config

# completely clean-up after ourselves, mostly for maintainers
.PHONY: pristine
pristine:
	rm -rf ./$(source)

