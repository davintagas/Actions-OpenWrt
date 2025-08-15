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
# rm -rf feeds.conf.default
# wget https://raw.githubusercontent.com/openwrt/openwrt/refs/heads/openwrt-24.10/feeds.conf.default

echo 'src-git l860 https://github.com/davintagas/openwrt-packages.git;l860' >>feeds.conf.default

# pushd target/linux/rockchip/patches-5.15
pushd target/linux/rockchip/patches-6.6
wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/refs/tags/v24.10.0/target/linux/rockchip/patches-6.6/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
