#!/bin/bash

set -x

rm -rf dl/rlite-master.tar.gz
make rlite-dirclean
# This usually requires temporarily using local SITE_METHOD
make
cp output/images/* ~/git/rlite/demo/buildroot/
