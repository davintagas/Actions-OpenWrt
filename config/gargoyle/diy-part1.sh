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

#mkdir -p targets/rockchip/profiles/large
#cp -rf targets/rockchip/profiles/default/* targets/rockchip/profiles/large/

sed -i 's/make $num_build_thread_str V=s/make $num_build_thread_str || make $num_build_thread_str || make $num_build_thread_str V=s/g' build.sh

pushd package/gargoyle/files/www/js
rm -rf basic.js
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/basic.js
popd

pushd package/gargoyle/files/www
rm -rf basic.sh
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/basic.sh

pushd package/plugin-gargoyle-i18n-English-EN/files/www/i18n/English-EN
rm -rf basic.js
wget https://raw.githubusercontent.com/davintagas/default/refs/heads/main/English-EN/basic.js
popd

