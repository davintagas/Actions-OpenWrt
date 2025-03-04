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
rm -rf targets/rockchip/profiles/default/config
wget -O targets/rockchip/profiles/default/config https://raw.githubusercontent.com/davintagas/default/refs/heads/main/gargoyle/config

sed -i '2d;3d;4d' targets/rockchip/profiles/default/profile_images
sed -i 's|friendlyarm_nanopi-r2s-|xunlong_orangepi-r1-plus-lts-|g' targets/rockchip/profiles/default/profile_images

sed -i 's|make $num_build_thread_str V=s|make $num_build_thread_str|g' build.sh
