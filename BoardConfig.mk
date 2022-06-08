#
# Copyright (C) 2022 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/realme/RMX3081

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX3081

# File systems
#BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
#BOARD_SUPER_PARTITION_SIZE := 8178892800
#BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
#BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
#
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_CMDLINE := ttyMSM0,115200n8 \
	androidboot.hardware=qcom \
	androidboot.console=ttyMSM0 \
	androidboot.memcg=1 \
	lpm_levels.sleep_disabled=1 \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	swiotlb=1 \
	androidboot.usbcontroller=a600000.dwc3 \
	androidboot.init_fatal_reboot_target=recovery \
	earlycon=msm_geni_serial,0xa88000 \
	loop.max_part=7 \
	buildvariant=user'
	
TARGET_PREBUILT_KERNEL  := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB 	:= $(DEVICE_PATH)/prebuilt/dtb.img
TARGET_RECOVERY_FSTAB 	:= $(DEVICE_PATH)/recovery.fstab
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"
TARGET_SUPPORTS_64_BIT_APPS := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_BASE		 :=	0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_OFFSET      :=	0x00008000
BOARD_KERNEL_TAGS_OFFSET :=	0x00000100
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
#
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
#
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
TARGET_KERNEL_ARCH := arm64

# Bootloader
PRODUCT_PLATFORM := atoll
TARGET_BOOTLOADER_BOARD_NAME := atoll
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := atoll
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
QCOM_BOARD_PLATFORMS += atoll

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2048
TW_DEFAULT_BRIGHTNESS := 1200
TW_EXCLUDE_TWRPAPP := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_BASH := true
TW_SKIP_COMPATIBILITY_CHECK := true
TW_OZIP_DECRYPT_KEY := 0000
TW_USE_TOOLBOX := true 
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_EXTRA_LANGUAGES := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone4/temp"
TW_NO_LEGACY_PROPS := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.version.sdk" #needed for Android 11 Gapps
TW_NO_SCREEN_BLANK := true



