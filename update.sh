#!/bin/bash

# This script updates the rlite image and copy it to
# the demo/buildroot directory in your repository.
#
# By default, rlite code to include in the image is
# taken from github. If you want to use the code of
# your local git tree, open package/rlite/rlite.mk
# and use the following configuration:
#
#   RLITE_SITE_METHOD = local
#   RLITE_SITE = /path/to/your/rlite/repo/

if [[ ! -f .config ]]; then
    cp RLITE_BUILDROOT_CONFIG .config
    echo "Imported default .config for rlite images"
fi

diff -pu .config RLITE_BUILDROOT_CONFIG > /dev/null
if [ "$?" != "0" ]; then
    echo "Warning: you are using a .config different from RLITE_BUILDROOT_CONFIG"
    echo "  I assume you know what you are doing ..."
fi

set -x

rm -rf dl/rlite-master.tar.gz
make rlite-dirclean
# This usually requires temporarily using local SITE_METHOD
make

# Copy the generated image to the demo/buildroot directory
# in your rlite git tree.
# Please change the destination directory with the path of
# your own rlite tree.
cp output/images/* ~/git/rlite/demo/buildroot/
