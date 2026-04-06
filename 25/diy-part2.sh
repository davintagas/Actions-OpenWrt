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
# sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add Custom package
git clone --depth 1 https://github.com/koshev-msk/modemfeed.git modemfeed
cp -rf modemfeed/luci/applications/luci-app-atinout package/
cp -rf modemfeed/luci/protocols/luci-proto-xmm package/
cp -rf modemfeed/packages/net/xmm-modem package/
cp -rf modemfeed/packages/telephony/atinout package/
rm -rf modemfeed

# internet detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git package/luci-app-internet-detector

# 3ginfo
git clone --depth 1 https://github.com/4IceG/luci-app-3ginfo-lite.git package/luci-app-3ginfo-lite
rm -rf package/luci-app-3ginfo-lite/sms-tool

# Add sms-tool
git clone --depth 1 https://github.com/4IceG/luci-app-sms-tool-js.git package/luci-app-sms-tool-js

# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/official/99-init-settings.sh
popd

pushd files/etc
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/atcommands.user
popd

mkdir -p files/etc/nftables.d
pushd files/etc/nftables.d
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/11-ttl.nft
popd

mkdir -p files/etc/openclash/core
pushd files/etc/openclash/core
wget https://github.com/vernesong/OpenClash/raw/refs/heads/core/master/meta/clash-linux-arm64.tar.gz
# wget https://github.com/vernesong/OpenClash/raw/refs/heads/core/master/smart/clash-linux-arm64.tar.gz
tar -xf clash-linux-arm64.tar.gz
rm -rf clash-linux-arm64.tar.gz
mv clash clash_meta
popd

# Golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang

# AdguardHome

# OpenClash
git clone --depth 1 -b v0.47.075 https://github.com/vernesong/OpenClash.git package/openclash
cp -rf package/openclash/luci-app-openclash package/luci-app-openclash
rm -rf package/openclash

pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# Add passwall
git clone --depth 1 -b 26.3.6-1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/passwall-packages
mv package/passwall-packages/{chinadns-ng,dns2socks,tcping} package/
rm -rf feeds/packages/net/{sing-box,v2ray-geodata,xray-core,microsocks}
mv package/passwall-packages/{sing-box,v2ray-geodata,xray-core,microsocks} feeds/packages/net/
rm -rf package/passwall-packages

# mosdns
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns

# Modify hostname
sed -i 's/OpenWrt/OrangePI/g' package/base-files/files/bin/config_generate
#
sed -i 's|llvm=true|llvm=false|g' feeds/packages/lang/rust/Makefile

# Qosmate
git clone --depth 1 https://github.com/hudra0/luci-app-qosmate.git package/luci-app-qosmate
git clone --depth 1 https://github.com/hudra0/qosmate.git package/qosmate
#

# status
git clone --depth 1 -b openwrt-25.12 https://github.com/immortalwrt/luci.git mortal-luci
rm -rf feeds/luci/modules/{luci-base,luci-mod-status}
cp -rf mortal-luci/modules/{luci-base,luci-mod-status} feeds/luci/modules/
rm -rf mortal-luci

#
