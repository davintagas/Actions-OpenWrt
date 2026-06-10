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

mkdir -p files/etc
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
cp -rf feeds/op_packages/luci-app-adguardhome/root/etc/init.d/adguardhome feeds/packages/net/adguardhome/files/adguardhome.init
rm -rf feeds/op_packages/luci-app-adguardhome/root/etc/init.d/adguardhome

# Modif
sed -i 's|llvm=true|llvm=false|g' feeds/packages/lang/rust/Makefile

#
