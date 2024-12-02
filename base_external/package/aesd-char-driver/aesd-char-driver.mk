
##############################################################
#
# AESD-CHAR-DRIVER
#
##############################################################

# Adding assignment-8 content
$(info    Building LDD repo packages...)
AESD_CHAR_DRIVER_VERSION = 7e8bda598959fda7cf35721050857d162d1cb820
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-sebaleme.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES
AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver/

#LDD_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
# The -m option sets the mode (access-control bits) of the installed object(s)
# The -d option specifies that the names are directories
define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
$(eval $(kernel-module))
$(info    End of AESD_CHAR build...)
