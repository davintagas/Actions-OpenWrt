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
sed -i 's|192.168.2.1|192.168.1.1|g' package/base-files/files/bin/config_generate

echo 'src-git modemfeed https://github.com/koshev-msk/modemfeed.git' >>feeds.conf.default
echo 'src-git 4icg https://github.com/4IceG/luci-app-3ginfo-lite.git' >>feeds.conf.default
echo 'src-git internet https://github.com/gSpotx2f/luci-app-internet-detector.git' >>feeds.conf.default
echo 'src-git 4icg-sms https://github.com/4IceG/luci-app-sms-tool-js.git' >>feeds.conf.default
echo 'src-git adh https://github.com/rufengsuixing/luci-app-adguardhome.git' >>feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
