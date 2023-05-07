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

# we may need these to provide functionality, but we'll be safe and add them
include $(common)/platform.mk
include $(common)/utility.mk

