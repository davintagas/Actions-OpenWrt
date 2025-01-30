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
git clone --depth 1 -b openwrt-21.02 https://github.com/orangepi-xunlong/openwrt.git r1+
rm -rf package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip}
cp -rf r1+/package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip,arm-trusted-firmware-rk3328} package/boot/
rm -rf target/linux/rockchip
cp -rf r1+/target/linux/rockchip target/linux/
rm -rf r1+
