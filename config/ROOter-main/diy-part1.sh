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
cat <<EOT >> configfiles/template/.config_r1+lts
CONFIG_PACKAGE_luci-app-internet-detector=y
CONFIG_PACKAGE_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-atinout=y
CONFIG_PACKAGE_luci-app-adguardhome=y
EOT

