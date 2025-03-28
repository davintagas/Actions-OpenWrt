#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.2.1/192.168.1.1/g' package/base-files/files/bin/config_generate
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root::0:0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add Package From Kiddin
git clone --depth 1 https://github.com/kiddin9/kwrt-packages.git kiddin
# Add driver l860-GL
cp -r kiddin/{luci-proto-xmm,xmm-modem} package/
# Add Atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Add internet-detector
cp -r kiddin/{luci-app-internet-detector,internet-detector} package/
# adh
cp -r kiddin/luci-app-adguardhome package/luci-app-adguardhome
# add sms
cp -r kiddin/{luci-app-sms-tool-js,sms-tool} package/
# add autocore
cp -rf kiddin/autocore package/
sed -i 's|bcm27xx-utils|bcm27xx-userland|g' package/autocore/Makefile
# add 3ginfo
cp -rf kiddin/luci-app-3ginfo-lite package/
# Delete Source
rm -rf kiddin

# Change golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# Change luci status
git clone --depth 1 -b openwrt-21.02 https://github.com/immortalwrt/luci.git mortal-luci
rm -rf feeds/luci/modules/{luci-base,luci-mod-status}
cp -rf mortal-luci/modules/{luci-base,luci-mod-status} feeds/luci/modules/
rm -rf mortal-luci

# change agh
git clone --depth 1 -b master https://github.com/immortalwrt/packages.git mortal-package
rm -rf feeds/packages/net/adguardhome
cp -rf mortal-package/net/adguardhome feeds/packages/net/
rm -rf mortal-package

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
