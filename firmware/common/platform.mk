
# what sort of host are we? impacts how we build things
hostos    = $(shell uname -s)

ifeq ($(mountdir),)
# macos gets a different mount directory
ifeq ($(hostos),Darwin)
mountdir  = /Volumes
else
# FIXME: this should probably be fixed to use the Linux mount dir in userspace
mountdir  = /mnt
endif
endif

