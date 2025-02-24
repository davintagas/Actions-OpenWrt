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

# Add Custom package
git clone --depth 1 https://github.com/kiddin9/kwrt-packages.git kiddin
cp -rf kiddin/luci-app-3ginfo-lite package/
cp -rf kiddin/{luci-proto-xmm,xmm-modem} package/
cp -rf kiddin/{luci-app-atinout,atinout} package/
cp -rf kiddin/luci-app-sms-tool-js package/
cp -rf kiddin/{luci-app-internet-detector,internet-detector} package/
cp -rf kiddin/{luci-app-cpufreq,cpufreq} package/
cp -rf kiddin/{luci-app-diskman,luci-app-disks-info} package/
cp -rf kiddin/luci-app-adguardhome package/
cp -rf kiddin/autocore package/
rm -rf kiddin

# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/official/99-init-settings.sh
popd

# Golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
