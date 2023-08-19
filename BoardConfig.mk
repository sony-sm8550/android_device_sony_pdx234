#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from sony sm8550-common
-include device/sony/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pdx234

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
TARGET_KERNEL_DIR := $(DEVICE_PATH)-kernel
KERNEL_MODULE_DIR := $(TARGET_KERNEL_DIR)/modules

BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_DIR)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_DIR)/dtbo.img
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/kernel

# Kernel modules
KERNEL_MODULES := $(wildcard $(KERNEL_MODULE_DIR)/*.ko)

BOARD_VENDOR_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_KERNEL_MODULES_LOAD)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_ARCHIVE := $(KERNEL_MODULE_DIR)/vendor_ramdisk_include.zip

# Props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# inherit from the proprietary version
-include vendor/sony/pdx234/BoardConfigVendor.mk
