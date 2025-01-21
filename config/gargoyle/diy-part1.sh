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
sed -i 's/$num_build_thread_str V=s/$num_build_thread_str || make -j1 || make -j1 V=s/g' build.sh
