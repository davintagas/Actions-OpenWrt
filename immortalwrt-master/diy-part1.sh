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
sed -i 's|CST-8|WIB-7|g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's|Shanghai|Jakarta|g' package/emortal/default-settings/files/99-default-settings-chinese

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
rm -rf feeds.conf.default
wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/refs/heads/openwrt-24.10/feeds.conf.default

echo 'src-git l860 https://github.com/davintagas/openwrt-packages.git;l860' >>feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
