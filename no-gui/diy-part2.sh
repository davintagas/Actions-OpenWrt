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
cp -rf kiddin/{luci-proto-xmm,xmm-modem} package/
cp -rf kiddin/atinout package/
rm -rf kiddin

# Add Core OpenClash
mkdir -p files/etc/openclash/core
pushd files/etc/openclash/core
wget https://github.com/vernesong/OpenClash/raw/refs/heads/core/master/meta/clash-linux-arm64.tar.gz
tar -xf clash-linux-arm64.tar.gz
rm -rf clash-linux-arm64.tar.gz
mv clash clash_meta
popd

# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/official/99-init-settings.sh
popd

# OpenClash
git clone --depth 1 -b v0.46.133 https://github.com/vernesong/OpenClash.git package/openclash
cp -rf package/openclash/luci-app-openclash package/luci-app-openclash
rm -rf package/openclash

pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# Modify hostname
sed -i 's/OpenWrt/OrangePI/g' package/base-files/files/bin/config_generate
