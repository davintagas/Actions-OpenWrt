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
sed -i 's/root::0:0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add internet-detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git internet-detector
mv internet-detector/{luci-app-internet-detector,internet-detector,internet-detector-mod-modem-restart} package/
rm -rf internet-detector

# Add app
git clone --depth 1 https://github.com/kiddin9/kwrt-packages.git kiddin
# Add cpufreq
cp -r kiddin/{luci-app-cpufreq,cpufreq} package/
# Atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Adguardhome
cp -r kiddin/luci-app-adguardhome package/
#rm -rf feeds/packages/net/adguardhome
#cp -r kiddin/adguardhome feeds/packages/net/
# Delete
rm -rf kiddin

# Add passwall
#rm -rf feeds/packages/net/{v2ray-core,v2ray-geodata}
#git clone --depth 1 -b 4.78-4 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
#git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages

# Change Golang
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# ff
#rm -rf feeds/packages/net/{microsocks,sing-box,trojan-go,xray-core}

# Add partisi change
#git clone https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
