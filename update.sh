#!/bin/bash

# This script updates the ouroboros image and copy it to
# the demo/buildroot directory in your repository.
#
# By default, ouroboros code to include in the image is
# taken from github. If you want to use the code of
# your local git tree, open package/ouroboros/ouroboros.mk
# and use the following configuration:
#
#   OUROBOROS_SITE_METHOD = local
#   OUROBOROS_SITE = /path/to/your/ouroboros/repo/

if [[ ! -f .config ]]; then
    cp OUROBOROS_BUILDROOT_CONFIG .config
    echo "Imported default .config for ouroboros images"
fi

diff -pu .config OUROBOROS_BUILDROOT_CONFIG > /dev/null
if [ "$?" != "0" ]; then
    echo "Warning: you are using a .config different from OUROBOROS_BUILDROOT_CONFIG"
    echo "  I assume you know what you are doing ..."
fi

set -x

rm -rf dl/ouroboros-master.tar.gz
make ouroboros-dirclean
# This usually requires temporarily using local SITE_METHOD
make

# Please change the destination directory with a path of your choice.
cp output/images/* /tmp/
