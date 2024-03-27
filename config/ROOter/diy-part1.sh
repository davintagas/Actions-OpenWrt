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
git clone -b openwrt-23.05 --depth 1 https://github.com/openwrt/openwrt.git v23.05
rm -rf package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip}
cp -r v23.05/package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip} package/boot/
cp -r target/linux/generic/pending-5.15/{900-driver2305.patch,900-option.patch,900-qcserial.patch} v23.05/target/linux/generic/pending-5.15/
rm -rf target/linux/{generic,rockchip}
cp -r v23.05/target/linux/{generic,rockchip} target/linux/

pushd target/linux/rockchip/patches-5.15
wget -O 999-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
