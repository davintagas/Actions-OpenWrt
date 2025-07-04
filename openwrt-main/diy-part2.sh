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
cp -rf kiddin/{luci-app-internet-detector,internet-detector} package/
cp -rf kiddin/{luci-app-cpufreq,cpufreq} package/
cp -rf kiddin/luci-app-diskman package/
cp -rf kiddin/luci-app-adguardhome package/
rm -rf package/luci-app-adguardhome/root/etc/adguardhome.yaml
wget -O package/luci-app-adguardhome/root/etc/adguardhome.yaml https://raw.githubusercontent.com/davintagas/default/refs/heads/main/adguardhome.yaml
cp -rf kiddin/autocore package/
cp -rf kiddin/luci-app-lite-watchdog package/
#cp -rf kiddin/{luci-app-qosmate,qosmate} package/
rm -rf kiddin

# Add sms-tool
git clone --depth 1 https://github.com/4IceG/luci-app-sms-tool.git package/luci-app-sms-tool
rm -rf package/luci-app-sms-tool/sms-tool

# status
git clone --depth 1 -b openwrt-24.10 https://github.com/immortalwrt/luci.git mortal-luci
rm -rf feeds/luci/modules/{luci-base,luci-mod-status}
cp -rf mortal-luci/modules/{luci-base,luci-mod-status} feeds/luci/modules/
rm -rf mortal-luci

# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/official/99-init-settings.sh
popd

pushd files/etc
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/atcommands.user
popd

mkdir -p files/etc/openclash/core
pushd files/etc/openclash/core
wget https://github.com/vernesong/OpenClash/raw/refs/heads/core/master/meta/clash-linux-arm64.tar.gz
tar -xf clash-linux-arm64.tar.gz
rm -rf clash-linux-arm64.tar.gz
mv clash clash_meta
popd

# Golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

rm -rf feeds/packages/net/adguardhome/Makefile
wget -O feeds/packages/net/adguardhome/Makefile https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/openwrt-24.10/net/adguardhome/Makefile
wget -O feeds/packages/net/adguardhome/test.sh https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/net/adguardhome/test.sh
pushd feeds/packages/net/adguardhome/files
rm -rf *
wget https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/openwrt-24.10/net/adguardhome/files/adguardhome.config
wget https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/openwrt-24.10/net/adguardhome/files/adguardhome.init
wget https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/net/adguardhome/files/adguardhome.sysctl
popd

# OpenClash
git clone --depth 1 -b v0.46.110 https://github.com/vernesong/OpenClash.git package/openclash
cp -rf package/openclash/luci-app-openclash package/luci-app-openclash
rm -rf package/openclash

pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# Add passwall
git clone --depth 1 -b 25.7.4-1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
mv package/passwall-packages/{chinadns-ng,dns2socks,tcping} package/
rm -rf feeds/packages/net/{sing-box,v2ray-geodata,xray-core,microsocks}
mv package/passwall-packages/{sing-box,v2ray-geodata,xray-core,microsocks} feeds/packages/net/
rm -rf package/passwall-packages

# Modify hostname
sed -i 's/OpenWrt/OrangePI/g' package/base-files/files/bin/config_generate
