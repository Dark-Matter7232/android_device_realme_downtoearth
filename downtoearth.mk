$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Release name
PRODUCT_RELEASE_NAME := downtoearth

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# MTK
PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.radio@2.0 \
    mtk-sms-fwk-ready

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
ifneq ($(findstring lineage, $(TARGET_PRODUCT)),)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
endif

# Init
PRODUCT_PACKAGES += \
    init.target.rc \
    kpoc_charger.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
    $(LOCAL_PATH)/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk/ld.config.26.txt:system/etc/ld.config.26.txt \
    $(LOCAL_PATH)/vndk/vndk.rc:system/etc/init/vndk.rc

# Call proprietary blob setup
$(call inherit-product-if-exists, vendor/realme/downtoearth/downtoearth-vendor.mk)
