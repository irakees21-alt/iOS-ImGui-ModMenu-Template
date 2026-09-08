# Настройки платформы под современные iOS
TARGET = iphone:clang:latest:15.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

# Имя твоего будущего файла меню
TWEAK_NAME = icedcave

# Какие файлы компилировать
icedcave_FILES = ImGuiDrawView.mm $(wildcard IMGUI/*.cpp)

# Подключение системных графических движков Apple
icedcave_FRAMEWORKS = UIKit Foundation Metal MetalKit
icedcave_CFLAGS = -fobjc-arc -I./IMGUI -DIMGUI_IMPL_METAL_CPP

include $(THEOS)/makefiles/tweak.mk
