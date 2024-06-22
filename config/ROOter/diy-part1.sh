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
git clone -b v22.03.5.R1PlusLTS --depth 1 https://github.com/ohabu/openwrt.git ttt

cp -rf ttt/package/boot/uboot-rockchip/Makefile package/boot/uboot-rockchip/
cp -rf ttt/target/linux/rockchip/armv8/base-files/etc/board.d/{01_leds,02_network} target/linux/rockchip/armv8/base-files/etc/board.d/
cp -rf ttt/target/linux/rockchip/armv8/base-files/etc/hotplug.d/net/40-net-smp-affinity target/linux/rockchip/armv8/base-files/etc/hotplug.d/net/
cp -rf ttt/target/linux/rockchip/armv8/config-5.10 target/linux/rockchip/armv8/
cp -rf ttt/target/linux/rockchip/image/{Makefile,armv8.mk} target/linux/rockchip/image/
cp -rf ttt/package/boot/uboot-rockchip/patches/{200-rockchip-rk3328-Add-support-for-Orangepi-R1-Plus.patch,201-Add-support-for-Orangepi-R1-Plus-LTS.patch} package/boot/uboot-rockchip/patches/
cp -rf ttt/package/boot/uboot-rockchip/src/of-platdata/{orangepi-r1-plus-lts-rk3328,orangepi-r1-plus-rk3328} package/boot/uboot-rockchip/src/of-platdata/
cp -rf ttt/target/linux/rockchip/patches-5.10/{202-rockchip-rk3328-Add-support-for-OrangePi-R1-Plus.patch,206-Add-support-for-OrangePi-R1-Plus-LTS.patch,600-Add-yt8531c-support.patch,801-char-add-support-for-rockchip-hardware-random-number.patch,802-arm64-dts-rockchip-add-hardware-random-number-genera.patch,803-PM-devfreq-rockchip-add-devfreq-driver-for-rk3328-dmc.patch,804-clk-rockchip-support-setting-ddr-clock-via-SIP-Version-2-.patch,805-PM-devfreq-rockchip-dfi-add-more-soc-support.patch,806-arm64-dts-rockchip-rk3328-add-dfi-node.patch,807-arm64-dts-nanopi-r2s-add-rk3328-dmc-relate-node.patch,808-phy-rockchip-add-driver-for-Rockchip-USB-3.0-PHY.patch,107-mmc-core-set-initial-signal-voltage-on-power-off.patch,911-kernel-dma-adjust-default-coherent_pool-to-2MiB.patch,991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch} target/linux/rockchip/patches-5.10/
cp -rf ttt/package/boot/arm-trusted-firmware-rk3328 package/boot/
cp -rf ttt/target/linux/rockchip/files target/linux/rockchip/
cp -rf ttt/target/linux/rockchip/armv8/base-files/etc/init.d target/linux/rockchip/armv8/base-files/etc/
cp -rf ttt/target/linux/rockchip/armv8/base-files/etc/rc.d target/linux/rockchip/armv8/base-files/etc/
cp -rf ttt/target/linux/rockchip/armv8/base-files/usr target/linux/rockchip/armv8/base-files/
rm -rf ttt

#pushd target/linux/generic/backport-5.15/
#wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/generic/backport-5.15/791-v6.6-11-net-phy-motorcomm-Add-pad-drive-strength-cfg-support.patch
#popd

#pushd target/linux/rockchip/patches-5.15/
#wget https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
#wget https://raw.githubusercontent.com/openwrt/openwrt/80ef582deebd13e3a46718f4012947e4b56f31cf/target/linux/rockchip/patches-5.15/009-v6.8-arm64-dts-rockchip-configure-eth-pad-driver-strength-for-.patch
#popd

#rm -rf target/linux/rockchip/image/mmc.bootscript
#wget -O target/linux/rockchip/image/mmc.bootscript https://raw.githubusercontent.com/openwrt/openwrt/openwrt-23.05/target/linux/rockchip/image/mmc.bootscript

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
