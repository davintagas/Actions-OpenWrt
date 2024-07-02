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
rm -rf tmp
sed -i 's|timeout=7|timeout=3|g' package/rooter/ext-rooter-basic/files/usr/lib/rooter/connect/chkconn1.sh
sed -i 's|eth0|eth2|g' target/linux/rockchip/armv8/base-files/etc/board.d/01_leds

pushd target/linux/rockchip/image/
rm -rf mmc.bootscript
wget https://raw.githubusercontent.com/openwrt/openwrt/openwrt-23.05/target/linux/rockchip/image/mmc.bootscript
popd

pushd target/linux/rockchip/patches-5.15/
wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
#wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/rockchip/patches-5.15/009-v6.8-arm64-dts-rockchip-configure-eth-pad-driver-strength-for-.patch
popd

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
