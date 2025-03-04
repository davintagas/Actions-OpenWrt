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
git clone --depth 1 https://github.com/obsy/packages.git obsy
cp -rf obsy/{plugin-gargoyle-3ginfo-extended,plugin-gargoyle-atcmd,plugin-gargoyle-modemband,plugin-gargoyle-smsbox,modemband} package/
rm -rf obsy

mkdir -p package/sms-tool
pushd package/sms-tool
wget https://raw.githubusercontent.com/openwrt/packages/refs/heads/openwrt-23.05/utils/sms-tool/Makefile
popd
