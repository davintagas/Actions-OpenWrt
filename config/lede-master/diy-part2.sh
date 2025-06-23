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
rm -rf feeds/luci/applications/luci-app-adguardhome
cp -rf kiddin/luci-app-adguardhome feeds/luci/applications/
rm -rf feeds/packages/net/adguardhome/Makefile
wget -O feeds/packages/net/adguardhome/Makefile https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/openwrt-24.10/net/adguardhome/Makefile
wget -O feeds/packages/net/adguardhome/test.sh https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/net/adguardhome/test.sh
pushd feeds/packages/net/adguardhome/files
rm -rf *
wget https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/openwrt-24.10/net/adguardhome/files/adguardhome.config
wget https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/openwrt-24.10/net/adguardhome/files/adguardhome.init
wget https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/net/adguardhome/files/adguardhome.sysctl
popd
# cp -rf kiddin/{luci-app-qosmate,qosmate} package/
rm -rf kiddin

sed -i 's|CST-8|WIB-7|g' package/lean/default-settings/files/zzz-default-settings
sed -i 's|Shanghai|Jakarta|g' package/lean/default-settings/files/zzz-default-settings

# OpenClash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth 1 -b v0.46.086 https://github.com/vernesong/OpenClash.git package/openclash
mv package/openclash/luci-app-openclash feeds/luci/applications/
rm -rf package/openclash

#pushd feeds/luci/applications/luci-app-openclash/tools/po2lmo
#make && sudo make install
#popd

#mkdir -p files/etc/openclash/core
#pushd files/etc/openclash/core
#wget https://github.com/vernesong/OpenClash/raw/refs/heads/core/master/meta/clash-linux-arm64.tar.gz
#tar -xf clash-linux-arm64.tar.gz
#rm -rf clash-linux-arm64.tar.gz
#mv clash clash_meta
#popd
#
#rm -rf feeds/packages/lang/rust
#git clone --depth 1 -b openwrt-24.10 https://github.com/openwrt/packages.git package/openwrt-24.10
#mv package/openwrt-24.10/lang/rust feeds/packages/lang/
#rm -rf package/openwrt-24.10

rm -rf feeds/lang/rust/Makefile
wget -O feeds/lang/rust/Makefile https://raw.githubusercontent.com/davintagas/default/refs/heads/main/Makefile
#
