#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#git clone -b openwrt-23.05 --depth 1 https://github.com/immortalwrt/immortalwrt.git
#rm -rf target/linux/rockchip
#cp -r immortalwrt/target/linux/rockchip target/linux/
#rm -rf include/kernel-5.15
#cp -r immortalwrt/include/kernel-5.15 include/
#rm -rf package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip}
#cp -r immortalwrt/package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip} package/boot/
#cp -r target/linux/generic/pending-5.15/{900-driver2305.patch,900-option.patch,900-qcserial.patch} immortalwrt/target/linux/generic/pending-5.15
#rm -rf target/linux/generic
#cp -r immortalwrt/target/linux/generic target/linux/
#rm -rf immortalwrt
sed -i 's|+wireless-tools ||g' package/rooter/ext-rooter-basic/Makefile

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
