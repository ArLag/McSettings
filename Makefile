
MinecraftSettings_CFLAGS = -fobjc-arc

ARCHS = arm64 arm64e
THEOS_DEVICE_IP = 192.168.2.116
include $(THEOS)/makefiles/common.mk
 DEBUG = 0

SUBPROJECTS += yeet
TWEAK_NAME = MinecraftSettings
MinecraftSettings_FILES = Tweak.xm


MinecraftSettings_EXTRA_FRAMEWORKS += Cephei
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/aggregate.mk
