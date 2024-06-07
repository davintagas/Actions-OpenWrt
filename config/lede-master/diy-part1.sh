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
sed -i '2d' feeds.conf.default
sed -i 's|#src-git luci|src-git luci|g' feeds.conf.default

rm -rf package/lean/csstidy
# sed -i 's|KERNEL_PATCHVER:=6.1|KERNEL_PATCHVER:=6.6|g' target/linux/rockchip/Makefile
# sed -i 's|KERNEL_TESTING_PATCHVER:=6.6||g' target/linux/rockchip/Makefile

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
