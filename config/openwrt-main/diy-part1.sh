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
rm -rf feeds.conf.default
wget https://raw.githubusercontent.com/openwrt/openwrt/openwrt-23.05/feeds.conf.default
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git modemfeed https://github.com/koshev-msk/modemfeed.git' >>feeds.conf.default
echo 'src-git 4icg https://github.com/4IceG/luci-app-3ginfo-lite.git' >>feeds.conf.default
echo 'src-git internet https://github.com/gSpotx2f/luci-app-internet-detector.git' >>feeds.conf.default

pushd target/linux/rockchip/patches-5.15
wget -O 999-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
