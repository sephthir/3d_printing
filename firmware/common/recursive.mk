default: all

# figure out where things we need live
reporoot  = $(shell git rev-parse --show-toplevel)
common    = $(reporoot)/firmware/common
external  = $(reporoot)/external
patches  ?= $(reporoot)/patches
# and make them available to subprocesses
MAKEOPTS := $(MAKEOPTS) reporoot=$(reporoot) \
                        common=$(common) \
                        external=$(external) \
                        patches=$(patches)

# we need these to provide utility stuff
include $(common)/platform.mk
include $(common)/utility.mk

define recursive_target
	@for subdir in $(subdirs); do \
	    $(call ansiout,\033[32;1m-- making $(1) in $$subdir --\033[0m,); \
	    $(MAKE) $(MAKEOPTS) -C $$subdir $(1); \
	done
endef

.PHONY: all clean sync pristine
all:
	$(call recursive_target,all)
clean:
	$(call recursive_target,clean)
sync:
	$(call recursive_target,sync)
pristine:
	$(call recursive_target,pristine)

