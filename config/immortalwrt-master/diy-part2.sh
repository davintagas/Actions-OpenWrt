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

# Add 3ginfo-lite
git clone -b main --depth 1 https://github.com/4IceG/luci-app-3ginfo-lite.git package/3ginfo-lite
rm -rf package/3ginfo-lite/{.github,sms-tool}

# Add theme
git clone -b js --depth 1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth 1 https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

# Add Package From Kiddin
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin
# Add driver l860-GL
cp -r kiddin/{luci-proto-xmm,xmm-modem} package/
# Add Atinout
cp -r kiddin/{luci-app-atinout,atinout} package/
# Add sms-tools
cp -r kiddin/{luci-app-sms-tool-js,sms-tool} package/
rm -rf feeds/packages/utils/sms-tool
# Add modemband
# cp -r kiddin/{luci-app-modemband,modemband} package/
# Add internet-detector
cp -r kiddin/luci-app-internet-detector package/luci-app-internet-detector
# Add luci-app-modemband
cp -r kiddin/{luci-app-modemband,modemband} package/
# Change smartdns
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
cp -r kiddin/{luci-app-smartdns,smartdns} package/

rm -rf kiddin

# Change ModemManager
git clone -b openwrt-23.05 --depth 1 https://github.com/openwrt/luci.git 23.05-luci
rm -rf feeds/luci/protocols/luci-proto-modemmanager
cp -r 23.05-luci/protocols/luci-proto-modemmanager feeds/luci/protocols/
rm -rf 23.05-luci
git clone -b openwrt-23.05 --depth 1 https://github.com/openwrt/packages.git 23.05-packages
rm -rf feeds/packages/net/modemmanager
cp -rf 23.05-packages/net/modemmanager feeds/packages/net/
rm -rf 23.05-packages
sed -i 's|include $(INCLUDE_DIR)/meson.mk||g' feeds/packages/net/modemmanager/Makefile

# Add Default Setting
sed -i 's/auto/en/g' package/emortal/default-settings/files/99-default-settings
sed -i 's/Shanghai/Jakarta/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's|https://mirrors.vsean.net/openwrt|https://immortalwrt.kyarucloud.moe|g' package/emortal/default-settings/files/99-default-settings-chinese

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
