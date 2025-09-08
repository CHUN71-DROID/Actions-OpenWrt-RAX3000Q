#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Enable wireless relay packages
sed -i 's/# CONFIG_PACKAGE_luci-app-wifischedule is not set/CONFIG_PACKAGE_luci-app-wifischedule=y/g' .config
sed -i 's/# CONFIG_PACKAGE_luci-proto-relay is not set/CONFIG_PACKAGE_luci-proto-relay=y/g' .config
sed -i 's/# CONFIG_PACKAGE_relayd is not set/CONFIG_PACKAGE_relayd=y/g' .config
sed -i 's/# CONFIG_PACKAGE_wpad is not set/CONFIG_PACKAGE_wpad=y/g' .config
sed -i 's/# CONFIG_PACKAGE_wpad-openssl is not set/CONFIG_PACKAGE_wpad-openssl=y/g' .config

# Apply shortcut-fe fix patch
if [ -f "patches/shortcut-fe-fix.patch" ]; then
    echo "Applying shortcut-fe fix patch..."
    git apply patches/shortcut-fe-fix.patch || true
fi

# Configure wireless relay settings
mkdir -p files/etc/config
cat > files/etc/config/wireless << EOF
config wifi-device 'radio0'
	option type 'mac80211'
	option path 'soc/c000000.wifi'
	option channel '36'
	option band '5g'
	option htmode 'VHT80'
	option country 'CN'
	option cell_density '0'
	option disabled '0'

config wifi-iface 'default_radio0'
	option device 'radio0'
	option network 'lan'
	option mode 'ap'
	option ssid 'RAX3000Q'
	option encryption 'psk2'
	option key 'password'

config wifi-iface 'relay_radio0'
	option device 'radio0'
	option network 'wwan'
	option mode 'sta'
	option ssid 'UpstreamWiFi'
	option encryption 'psk2'
	option key 'upstreampassword'
	option disabled '1'

config wifi-device 'radio1'
	option type 'mac80211'
	option path 'soc/c000000.wifi+1'
	option channel '1'
	option band '2g'
	option htmode 'HT20'
	option country 'CN'
	option cell_density '0'
	option disabled '0'

config wifi-iface 'default_radio1'
	option device 'radio1'
	option network 'lan'
	option mode 'ap'
	option ssid 'RAX3000Q'
	option encryption 'psk2'
	option key 'password'
EOF

cat > files/etc/config/network.relay << EOF
config interface 'wwan'
	option proto 'relay'
	option network 'wan'
	option ipaddr '192.168.1.2'
	option macaddr '7C:6A:60:33:FF:3E'

config interface 'lan'
	option proto 'static'
	option ipaddr '192.168.10.1'
	option netmask '255.255.255.0'
	option macaddr '7C:6A:60:33:FF:3D'
EOF
