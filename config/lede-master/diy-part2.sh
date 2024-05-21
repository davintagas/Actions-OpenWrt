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
./scripts/feeds update -a && ./scripts/feeds install -a -f
rm -rf feeds/luci/applications/luci-app-v2raya
# rm -rf package/lean/default-settings

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add modeminfo
git clone --depth 1 https://github.com/4IceG/luci-app-3ginfo-lite.git package/luci-app-3ginfo-lite
rm -rf package/luci-app-3ginfo-lite/sms-tool

# Add internet-detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git internet-detector
mv internet-detector/{luci-app-internet-detector,internet-detector,internet-detector-mod-modem-restart} package/
rm -rf internet-detector

# Add theme
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#rm -rf feeds/luci/applications/luci-app-argon-config
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# Add source
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin

rm -rf feeds/packages/net/mosdns
cp -r kiddin/mosdns feeds/packages/net/mosdns
cp -r kiddin/luci-app-mosdns package/luci-app-mosdns

# Add sms-tool
cp -r kiddin/luci-app-sms-tool-js package/luci-app-sms-tool-js

# Add modemband
cp -r kiddin/{luci-app-modemband,modemband} package/

# Add atinout
cp -r kiddin/{luci-app-atinout,atinout} package/

# Add driver L860-GL
cp -r kiddin/{luci-proto-xmm,xmm-modem} package/

# Delete
rm -rf kiddin

# Add mosdns
# rm -rf feeds/packages/utils/v2dat
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/luci/applications/luci-app-mosdns
# git clone --depth 1 https://github.com/sbwml/luci-app-mosdns.git mosdns
# mv mosdns/{luci-app-mosdns,mosdns,v2dat} package/
# rm -rf mosdns
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
# rm -rf feeds/packages/net/v2ray-geodata
# git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# Add Default Setting
#sed -i 's/zh_cn/en/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's/Shanghai/Jakarta/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's|CST-8|WIB-7|g' package/lean/default-settings/files/zzz-default-settings

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
