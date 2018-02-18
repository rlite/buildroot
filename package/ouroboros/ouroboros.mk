#############################################################
#
# rlite
#
#############################################################
OUROBOROS_VERSION = master

OUROBOROS_SITE_METHOD = git
OUROBOROS_SITE = http://ouroboros.ilabt.imec.be/git/ouroboros
# Uncomment the following two and comment the two above to
# build the image with the rlite code in your local git tree
#OUROBOROS_SITE_METHOD = local
#OUROBOROS_SITE = /home/user/ouroboros

# e.g. useful for patched dropbear
OUROBOROS_INSTALL_STAGING = YES
OUROBOROS_INSTALL_TARGET = YES
OUROBOROS_LICENSE = GPLv2

OUROBOROS_DEPENDENCIES = protobuf-c host-swig libgcrypt openssl libfuse
# For some reason buildroot uses "/usr" as default install prefix,
# so we have to override it
OUROBOROS_CONF_OPTS = -DCMAKE_INSTALL_PREFIX="/"

OUROBOROS_MODULE_SUBDIRS = kernel

# Invoke the rlite ./configure script to generate kernel Makefile and
# symbolic links. Use the --kernbuilddir option to allow kernel probing
# tests to be run on the buildroot kernel (tough with the host native
# compiler).
define OUROBOROS_DO_CONFIGURE
	echo "Preliminary configure to generate some files ..."
	cd $(@D) && echo "Nothing to do"
	echo "... done!"
endef

OUROBOROS_PRE_CONFIGURE_HOOKS += OUROBOROS_DO_CONFIGURE

$(eval $(cmake-package))
