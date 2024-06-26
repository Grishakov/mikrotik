/interface wireless
# 2ghz
set [ find default-name=wlan1 ] \
	band=2ghz-b/g/n \
	adaptive-noise-immunity=ap-and-client-mode \
	channel-width=20/40mhz-XX \
	country=no_country_set \
	distance=indoors \
	frequency=auto \
	frequency-mode=superchannel \
	hw-protection-mode=rts-cts \
	installation=indoor \
	mode=ap-bridge \
	skip-dfs-channels=all  \
	wmm-support=enabled 
#
# 5 ghz
#
set [ find default-name=wlan2 ] \
	band=5ghz-a/n/ac \
	adaptive-noise-immunity=ap-and-client-mode \
	channel-width=20/40/80mhz-XXXX \
	country=no_country_set \
	distance=indoors \
	frequency=auto \
	frequency-mode=superchannel \
	hw-protection-mode=rts-cts \
	installation=indoor \
	mode=ap-bridge \
	skip-dfs-channels=all \
	wmm-support=enabled 
#
# Group key update
#
/interface wireless security-profiles
set [ find default=yes ] \
	authentication-types=wpa2-psk \
	group-key-update=12h
#
# Enable WMM
#
/ip firewall mangle
add action=set-priority chain=postrouting new-priority=from-dscp-high-3-bits passthrough=yes
