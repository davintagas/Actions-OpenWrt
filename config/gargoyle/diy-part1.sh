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
pushd targets/rockchip/profiles/default
rm -rf *
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/gargoyle/config
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/profile_images
popd

pushd package/gargoyle-profiles
rm -rf Makefile
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/gargoyle/Makefile
popd

sed -i 's/make $num_build_thread_str V=s/make $num_build_thread_str || make $num_build_thread_str || make $num_build_thread_str V=s/g' build.sh
