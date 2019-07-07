# Inherit from device
$(call inherit-product, device/realme/downtoearth/downtoearth.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := downtoearth
PRODUCT_NAME := lineage_downtoearth
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme 1
PRODUCT_MANUFACTURER := realme

# Override fingerprint from stock
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_oppo6771_17061-user 8.1.0 O11019 1550589611 release-keys" \
    PRODUCT_NAME="downtoearth" \
    TARGET_DEVICE="downtoearth"

