#############################################################
#
# rlite
#
#############################################################
RLITE_VERSION = master

RLITE_SITE_METHOD = git
RLITE_SITE = https://github.com/vmaffione/rlite.git
# Uncomment the following two and comment the two above to
# build the image with the rlite code in your local git tree
#RLITE_SITE_METHOD = local
#RLITE_SITE = /home/vmaffione/git/rlite

# e.g. useful for patched dropbear
RLITE_INSTALL_STAGING = YES
RLITE_INSTALL_TARGET = YES
RLITE_LICENSE = GPLv2

RLITE_DEPENDENCIES = protobuf host-swig
# For some reason buildroot uses "/usr" as default install prefix,
# so we have to override it
RLITE_CONF_OPTS = -DCMAKE_INSTALL_PREFIX="/" -DMAC2IFNAME=ON

RLITE_MODULE_SUBDIRS = kernel

# Invoke the rlite ./configure script to generate kernel
# Makefile and symbolic links
define RLITE_DO_CONFIGURE
	echo "Preliminary configure to generate some files ..."
	cd $(@D) && ./configure
	echo "... done!"
endef

RLITE_PRE_CONFIGURE_HOOKS += RLITE_DO_CONFIGURE

$(eval $(kernel-module))
$(eval $(cmake-package))
