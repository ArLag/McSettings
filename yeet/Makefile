include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = yeetprefs
yeetprefs_FILES = lolRootListController.m
yeetprefs_EXTRA_FRAMEWORKS += Cephei
yeetprefs_INSTALL_PATH = /Library/PreferenceBundles
yeetprefs_FRAMEWORKS = UIKit
yeetprefs_PRIVATE_FRAMEWORKS = Preferences
yeetprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/yeetprefs.plist$(ECHO_END)
