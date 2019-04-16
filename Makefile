ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk
GO_EASY_ON_ME=1

TWEAK_NAME = MinecraftSettings
MinecraftSettings_FILES = Tweak.xm
MinecraftSettings_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

GO_EASY_ON_ME = 1
FINALPACKAGE = 1
DEBUG = 0
SUBPROJECTS += yeet

include $(THEOS_MAKE_PATH)/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"
