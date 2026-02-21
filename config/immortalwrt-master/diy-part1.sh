#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/emortal/{autosamba,ipv6-helper}

# hardware mod
sed -i '/define Device\/tplink_tl-wr740n-v5/,/endef/{s/  \$(Device\/tplink-4mlzma)/  $(Device\/tplink-16mlzma)/}' target/linux/ath79/image/tiny-tp-link.mk
sed -i '/switch-phy-addr-swap\|switch-phy-swap/s/<1>/<0>/g' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/lan4 {/,/};/s/gpios = <&gpio 17 GPIO_ACTIVE_LOW>;/gpios = <\&gpio 13 GPIO_ACTIVE_HIGH>;/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/wan {/,/};/s/gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;/gpios = <\&gpio 17 GPIO_ACTIVE_LOW>;/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/firmware: partition@20000 {/,/};/s/reg = <0x20000 0x3d0000>;/reg = <0x20000 0xfd0000>;/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/art: partition@3f0000 {/,/};/s/art: partition@3f0000/art: partition@ff0000/; /art: partition@ff0000 {/,/};/s/reg = <0x3f0000/reg = <0xff0000/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
