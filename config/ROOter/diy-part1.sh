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
pushd target/linux/generic/backport-5.15
wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/generic/backport-5.15/791-v6.6-11-net-phy-motorcomm-Add-pad-drive-strength-cfg-support.patch
popd

pushd target/linux/rockchip/patches-5.15
wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/rockchip/patches-5.15/009-v6.8-arm64-dts-rockchip-configure-eth-pad-driver-strength-for-.patch
popd

sed -i 's|swiotlb=1 ||g' target/linux/rockchip/image/mmc.bootscript
sed -i 's|console=tty1 ||g' target/linux/rockchip/image/mmc.bootscript

pushd target/linux/rockchip/patches-5.15
wget -O 999-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
