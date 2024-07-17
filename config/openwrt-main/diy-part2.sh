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

# Add theme
git clone -b js --depth 1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

# Change Custom
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin
rm -rf feeds/luci/modules/{luci-base,luci-mod-status}
cp -r kiddin/{luci-base,luci-mod-status} feeds/luci/modules/
cp -r kiddin/autocore package/autocore

# Add ramfree
cp -r kiddin/luci-app-ramfree package/luci-app-ramfree
# Add sms-tool
cp -r kiddin/luci-app-sms-tool-js package/luci-app-sms-tool-js
# Add modemband
cp -r kiddin/{luci-app-modemband,modemband} package/
# Add cpufreq
cp -r kiddin/{luci-app-cpufreq,cpufreq} package/
# Add driver l860
# cp -r kiddin/{luci-proto-xmm,xmm-modem} package/
# Add atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Delete
rm -rf kiddin

# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
# rm -rf feeds/packages/net/v2ray-geodata
# rm -rf feeds/passwall_packages/v2ray-geodata
# git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/official/99-init-settings.sh
popd

sed -i 's|/bin/ash|/bin/bash|g' package/base-files/files/etc/shells

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
