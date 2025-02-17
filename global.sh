#!/bin/bash

set -ex

scriptpath="$(readlink -f "$0")"
SLIM_CFG_TOP_DIR="${scriptpath%/${0##*/}}"
SLIM_CFG_OPENWRT_BRANCH="openwrt-19.07"
SLIM_CFG_OPENWRT_COMMIT="d5ae5658730a82312a20e68220f92f611b11d094"
SLIM_CFG_OPENWRT_ABBREV_COMMIT=$( echo "$SLIM_CFG_OPENWRT_COMMIT" | cut -b 1-7 )
SLIM_CFG_OPENWRT_VERSION="19.07"
SLIM_CFG_TARGET="armvirt"
SLIM_CFG_ARCH="64"

SLIM_CFG_DOWNLOAD_PATH="$SLIM_CFG_TOP_DIR/downloaded"
SLIM_CFG_CLONE_PATH="$SLIM_CFG_TOP_DIR/downloaded/$SLIM_CFG_OPENWRT_BRANCH-$SLIM_CFG_OPENWRT_ABBREV_COMMIT"

if [ -z $SLIM_CFG_PROFILE ]
then
    SLIM_CFG_PROFILE="slim"
fi

echo Work with profile : $SLIM_CFG_PROFILE
SLIM_CFG_PROFILE_DIR="$SLIM_CFG_TOP_DIR/profiles/$SLIM_CFG_PROFILE"


# should override by profile
SLIM_CFG_WORK_PATH=""
SLIM_CFG_BIN_IMG_DIR=""
SLIM_CFG_PATCHES_MODULES=""
