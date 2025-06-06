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

pushd target/linux/rockchip/patches-5.15
wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/refs/heads/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
