################################################################################
#
# edgelab-hellolib
#
################################################################################

EDGELAB_HELLOLIB_VERSION = 8e6159ded2994385c88b071dc688020d639947c0
EDGELAB_HELLOLIB_SITE = https://github.com/HanaTIL/buildroot-hello-c-dependency.git
EDGELAB_HELLOLIB_SITE_METHOD = git
EDGELAB_HELLOLIB_INSTALL_STAGING = YES
EDGELAB_HELLOLIB_LICENSE = MIT
EDGELAB_HELLOLIB_LICENSE_FILES = LICENSE

define EDGELAB_HELLOLIB_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define EDGELAB_HELLOLIB_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/hellolib.h $(STAGING_DIR)/usr/include
	$(INSTALL) -D -m 0755 $(@D)/libhello.so.1.0 $(STAGING_DIR)/usr/lib
	ln -sf libhello.so.1.0 $(STAGING_DIR)/usr/lib/libhello.so.1
	ln -sf libhello.so.1 $(STAGING_DIR)/usr/lib/libhello.so
endef

define EDGELAB_HELLOLIB_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libhello.so.1.0 $(TARGET_DIR)/usr/lib
	ln -sf libhello.so.1.0 $(TARGET_DIR)/usr/lib/libhello.so.1
endef

$(eval $(generic-package))