################################################################################
#
# openal
#
################################################################################

OPENAL_VERSION = 1.10.622
OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
OPENAL_LICENSE = LGPL-2.0+
OPENAL_LICENSE_FILES = COPYING
OPENAL_INSTALL_STAGING = YES

# We don't need examples, tests and utilities, Distros don't ship them either
OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF -DALSOFT_EXAMPLES=OFF -DALSOFT_TESTS=OFF

OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_OSS=ON

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
OPENAL_CONF_OPTS += -DEXTRA_LIBS=atomic
endif

ifeq ($(BR2_STATIC_LIBS),y)
OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
endif

$(eval $(cmake-package))
