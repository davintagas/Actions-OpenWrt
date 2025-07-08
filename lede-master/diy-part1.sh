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

sed -i 's|CST-8|WIB-7|g' package/lean/default-settings/files/zzz-default-settings
sed -i 's|Shanghai|Jakarta|g' package/lean/default-settings/files/zzz-default-settings

rm -rf target/linux/rockchip/Makefile
wget -O target/linux/rockchip/Makefile https://raw.githubusercontent.com/davintagas/default/refs/heads/main/lede/Makefile

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
