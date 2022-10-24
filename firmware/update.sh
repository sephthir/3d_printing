#!/usr/bin/env bash

################################################################################

set -e

################################################################################

resolve() {
    if which realpath >/dev/null 2>&1; then
        realpath "$1"
        return $?
    fi
    if which greadlink >/dev/null 2>&1; then
        greadlink -f "$1"
        return $?
    fi
    if which readlink >/dev/null 2>&1; then
        readlink -f "$1"
        return $?
    fi
    return 1
}
repo_base="$(resolve "$(dirname "$0")/..")"

ensure_symlink() {
    if [ -e "$2" ]; then
        unlink "$2"
    fi
    ln -s "$1" "$2"
}

################################################################################

pushd "$repo_base" >/dev/null 2>&1

git submodule update --init
rsync -auv external/klipper/* firmware/ebb36/klipper
ensure_symlink ../klipper_config firmware/ebb36/klipper/.config

popd >/dev/null 2>&1

################################################################################
