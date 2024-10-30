#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
#sed -i 's|+iptables-nft +ip6tables-nft|+iptables-nft|g' package/rooter/ext-rooter-basic/Makefile
#sed -i 's|+kmod-rt2800-usb +xxd +kmod-tcp-bbr|+kmod-rt2800-usb|g' package/rooter/ext-rooter-basic/Makefile
wget -O configfiles/template/.config_r1+ https://raw.githubusercontent.com/davintagas/default/refs/heads/main/ROOter/.config_r1%2B
rm -rf router2305.json
rm -rf build
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/ROOter/router2305.json
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/ROOter/build
chmod +x build
# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
