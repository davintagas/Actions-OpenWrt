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
# sed -i 's/root::0:0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add app
git clone --depth 1 https://github.com/kiddin9/kwrt-packages.git kiddin
# Add internet-detector
cp -r kiddin/{luci-app-internet-detector,internet-detector} package/
# Add cpufreq
cp -r kiddin/{luci-app-cpufreq,cpufreq} package/
# Atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Adguardhome
cp -r kiddin/luci-app-adguardhome package/
# Delete
rm -rf kiddin

# OpenClash
git clone --depth 1 -b v0.46.086 https://github.com/vernesong/OpenClash.git package/openclash
cp -rf package/openclash/luci-app-openclash package/luci-app-openclash
rm -rf package/openclash

pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# Golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
