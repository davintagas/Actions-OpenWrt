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
git clone --depth 1 https://github.com/koshev-msk/modemfeed.git modemfeed
mkdir packages
cp -r packages/net/xmm-modem packages/xmm-modem
rm -rf modemfeed

git clone --depth https://github.com/obsy/packages.git obsy_packages
cp -rf obsy_packages/{plugin-gargoyle-3ginfo,plugin-gargoyle-3ginfo-extended,3ginfo,plugin-gargoyle-atcmd,plugin-gargoyle-smsbox,plugin-gargoyle-modemband,modemband} packages/
rm -rf obsy_packages

mkdir -p packages/sms-tool
pushd packages/sms-tool
wget https://raw.githubusercontent.com/openwrt/packages/refs/heads/openwrt-23.05/utils/sms-tool/Makefile
popd
