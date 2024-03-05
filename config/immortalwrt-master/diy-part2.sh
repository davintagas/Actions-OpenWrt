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
# Add Modeminfo
git clone --depth 1 https://github.com/4IceG/luci-app-3ginfo-lite.git 3ginfo
mv 3ginfo/luci-app-3ginfo-lite package/
rm -rf 3ginfo
# Add sms
git clone --depth 1 https://github.com/4IceG/luci-app-sms-tool-js.git app-sms
mv app-sms/luci-app-sms-tool-js package/
rm -rf app-sms
# Add internet-detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git internet-detector
mv internet-detector/{luci-app-internet-detector,internet-detector,internet-detector-mod-modem-restart} package/
rm -rf internet-detector
# Add theme
git clone -b js --depth 1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

# Change base
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin
# rm -rf feeds/luci/modules/{luci-base,luci-mod-status}
# cp -r kiddin/{luci-base,luci-mod-status} feeds/luci/modules/
# Add autocore
# cp -r kiddin/autocore package/
# sed -i 's/utils/userland/g' package/autocore/Makefile
# Add diskman
cp -r kiddin/luci-app-diskman package/luci-app-diskman
# Add ramfree
cp -r kiddin/luci-app-ramfree package/luci-app-ramfree
# Add fullconenat
cp -r kiddin/fullconenat package/fullconenat
# Add turboacc
cp -r kiddin/{shortcut-fe,dnsproxy,dnsforwarder,pdnsd-alt,luci-app-turboacc} package/
cp -r kiddin/sms-tool package/
# Delete
rm -rf kiddin
# change firewall
git clone -b openwrt-21.02 --depth 1 https://github.com/immortalwrt/immortalwrt.git package/mortal-21.02
rm -rf package/network/config/firewall
cp -r package/mortal-21.02/package/network/config/firewall package/network/config/
rm -rf package/mortal-21.02
# Change modemmanager
git clone -b master --depth 1 https://github.com/openwrt/packages.git package/openwrt-packages
rm -rf feeds/packages/net/modemmanager
cp -r package/openwrt-packages/net/modemmanager feeds/packages/net/
rm -rf package/openwrt-packages
# Change luci-proto-modemmanager
git clone -b master --depth 1 https://github.com/openwrt/luci.git package/luci-packages
rm -rf feeds/luci/protocols/luci-proto-modemmanager
cp -r package/luci-packages/protocols/luci-proto-modemmanager feeds/luci/protocols/
# Add mosdns
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns.git mosdns
mv mosdns/{luci-app-mosdns,mosdns,v2dat} package/
rm -rf mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/passwall_packages/v2ray-geodata
git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/official/99-init-settings.sh
popd

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
