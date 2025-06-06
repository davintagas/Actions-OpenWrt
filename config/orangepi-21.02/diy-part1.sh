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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#rm -rf configs
#rm -rf target/linux/rockchip/armv8/base-files/usr/bin/resize-rootfs.sh
#rm -rf target/linux/rockchip/armv8/base-files/etc/rc.d/S22resize-rootfs
#rm -rf target/linux/rockchip/armv8/base-files/etc/init.d/resize-rootfs
pushd target/linux/rockchip/patches-5.4
wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/refs/heads/openwrt-21.02/target/linux/rockchip/patches-5.4/105-mmc-core-set-initial-signal-voltage-on-power-off.patch
popd
#
