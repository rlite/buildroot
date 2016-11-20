#############################################################
#
# rlite
#
#############################################################
RLITE_VERSION = master
RLITE_SITE = https://github.com/vmaffione/rlite.git
RLITE_SITE_METHOD = git
#RLITE_SITE = /home/vmaffione/git/rlite
#RLITE_SITE_METHOD = local
# e.g. useful for patched dropbear
RLITE_INSTALL_STAGING = YES
RLITE_INSTALL_TARGET = YES
RLITE_LICENSE = GPLv2

RLITE_DEPENDENCIES = protobuf
# For some reason buildroot uses "/usr" as default install prefix,
# so we have to override it
RLITE_CONF_OPTS = -DCMAKE_INSTALL_PREFIX="/"

RLITE_MODULE_SUBDIRS = kernel

$(eval $(kernel-module))
$(eval $(cmake-package))
