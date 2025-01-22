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
cp -r packages/net/xmm-modem package/
rm -rf modemfeed

