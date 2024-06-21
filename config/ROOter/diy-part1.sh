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

#pushd target/linux/rockchip/patches-5.15/
#wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
#wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/rockchip/patches-5.15/009-v6.8-arm64-dts-rockchip-configure-eth-pad-driver-strength-for-.patch
#popd

#pushd target/linux/generic/backport-5.15/
#wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/generic/backport-5.15/791-v6.6-11-net-phy-motorcomm-Add-pad-drive-strength-cfg-support.patch
#popd

git clone -b openwrt-23.05 --depth 1 https://github.com/immortalwrt/immortalwrt.git lede
cp -r target/linux/generic/pending-5.15/{900-driver2305.patch,900-option.patch,900-qcserial.patch} lede/target/linux/generic/pending-5.15
rm -rf target/linux/generic/{backport-5.15,config-5.15,hack-5.15,pending-5.15,files}
cp -r lede/target/linux/generic/{backport-5.15,config-5.15,hack-5.15,pending-5.15,files} target/linux/generic/
rm -rf target/linux/rockchip/{armv8,image,patches-5.15}
cp -r lede/target/linux/rockchip/{armv8,image,patches-5.15} target/linux/rockchip/
rm -rf package/boot/{uboot-rockchip,arm-trusted-firmware-rockchip}
cp -r lede/package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip} package/boot/
cp -rf lede/include/kernel-5.15 include/
rm -rf lede

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
