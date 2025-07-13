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

# openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth 1 -b v0.46.120 https://github.com/vernesong/OpenClash.git package/OpenClash
mv package/OpenClash/luci-app-openclash package/
rm -rf package/OpenClash
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

mkdir -p files/etc/openclash/core
pushd files/etc/openclash/core
wget https://github.com/vernesong/OpenClash/raw/refs/heads/core/master/meta/clash-linux-arm64.tar.gz
tar -xf clash-linux-arm64.tar.gz
rm -rf clash-linux-arm64.tar.gz
mv clash clash_meta
popd

# atc
#git clone --depth 1 https://github.com/mrhaav/openwrt-packages.git package/atc
#mv package/atc/{luci,atc-fib-l850_gl} package/
#rm -rf package/atc
#rm -rf package/atc-fib-l850_gl/files/lib/netifd/proto/atc.sh
#pushd package/atc-fib-l850_gl/files/lib/netifd/proto
#wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/atc.sh
#popd

# 3ginfo
git clone --depth 1 https://github.com/4IceG/luci-app-3ginfo-lite.git package/luci-app-3ginfo-lite
rm -rf package/luci-app-3ginfo-lite/sms-tool

# detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git package/luci-app-internet-detector

# modemfeed
git clone --depth 1 https://github.com/koshev-msk/modemfeed.git package/modemfeed
mv package/modemfeed/luci/protocols/luci-proto-xmm package/
mv package/modemfeed/packages/net/xmm-modem package/
rm -rf package/modemfeed

# atinout
git clone --depth 1 https://github.com/4IceG/luci-app-atinout.git package/luci-app-atinout

# sms-tool
git clone --depth 1 https://github.com/4IceG/luci-app-sms-tool.git package/luci-app-sms-tool

#

