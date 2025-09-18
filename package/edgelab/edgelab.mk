################################################################################
#
# edgelab
#
################################################################################

EDGELAB_VERSION = 7940288bedcf91e32ae4722a740f6888379b40fa
EDGELAB_SITE = https://github.com/HanaTIL/buildroot-hello-c.git
EDGELAB_SITE_METHOD = git
EDGELAB_LICENSE = MIT
EDGELAB_LICENSE_FILES = LICENSE
EDGELAB_DEPENDENCIES = edgelab-hellolib

define EDGELAB_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define EDGELAB_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/hello $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))