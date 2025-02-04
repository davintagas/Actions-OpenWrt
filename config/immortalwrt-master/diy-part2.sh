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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add theme
# git clone -b js --depth 1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth 1 https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

# Add Package From Kiddin
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin
# Add driver l860-GL
cp -r kiddin/{luci-proto-xmm,xmm-modem} package/
# Add Atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Add internet-detector
cp -r kiddin/luci-app-internet-detector package/luci-app-internet-detector
# DNSProxy
cp -r kiddin/{luci-app-dnsproxy,dnsproxy} package/
# Delete Source
rm -rf kiddin

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
