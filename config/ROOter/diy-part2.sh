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
# sed -i 's/root::0:0:99999:7:::/root:$1$wGIpIvlO$H3XgR7517Ex7I6fQ2jHwv0:19786:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add internet-detector
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector.git internet-detector
mv internet-detector/{luci-app-internet-detector,internet-detector,internet-detector-mod-modem-restart} package/
rm -rf internet-detector

# Add theme
git clone -b js --depth 1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth 1 https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

# Add mortal
git clone -b openwrt-23.05 --depth 1 https://github.com/immortalwrt/luci.git mortal
rm -rf feeds/luci/modules/{luci-base,luci-mod-status}
cp -r mortal/modules/{luci-base,luci-mod-status} feeds/luci/modules/
cp -r mortal/applications/luci-app-adblock-fast feeds/luci/applications/
rm -rf mortal
git clone -b openwrt-23.05 --depth 1 https://github.com/immortalwrt/packages.git mortal
cp -r mortal/net/adblock-fast package/
rm -rf mortal

# Add app
git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git kiddin
# Add ramfree
cp -r kiddin/luci-app-ramfree package/luci-app-ramfree
# Add cpufreq
cp -r kiddin/{luci-app-cpufreq,cpufreq} package/
# Change
cp -r kiddin/autocore package/
sed -i 's|bcm27xx-utils|bcm27xx-userland|g' package/autocore/Makefile
# Atinout
cp -r kiddin/atinout package/
# Delete
rm -rf kiddin

# Add Default Setting
mkdir -p files/etc/uci-defaults
pushd files/etc/uci-defaults
wget https://raw.githubusercontent.com/davintagas/default/main/rooter/99-init-settings.sh
popd

pushd files/etc
wget https://raw.githubusercontent.com/davintagas/default/main/bash.bashrc
popd

mkdir -p files/etc/profile.d/
pushd files/etc/profile.d
wget https://raw.githubusercontent.com/davintagas/default/main/30-sysinfo.sh
popd

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
