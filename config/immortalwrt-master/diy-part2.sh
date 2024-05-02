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

# Add internet-detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git internet-detector
mv internet-detector/{luci-app-internet-detector,internet-detector,internet-detector-mod-modem-restart} package/
rm -rf internet-detector

# Add theme
git clone -b js --depth 1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth 1 https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

# Add mosdns
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns.git mosdns
mv mosdns/{luci-app-mosdns,mosdns,v2dat} package/
rm -rf mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/mosdns
git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# Add Custom Package
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin
# Add driver l860-GL
cp -r kiddin/{luci-proto-xmm,xmm-modem} package/
# Add Atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Add sms-tools
cp -r kiddin/luci-app-sms-tool package/luci-app-sms-tool
# Add modemband
cp -r kiddin/{luci-app-modemband,modemband} package/

rm -rf kiddin

# Add Default Setting
sed -i 's/auto/en/g' package/emortal/default-settings/files/99-default-settings
sed -i 's/Shanghai/Jakarta/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's|https://mirrors.vsean.net/openwrt|https://immortalwrt.kyarucloud.moe|g' package/emortal/default-settings/files/99-default-settings-chinese

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
