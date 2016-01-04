#!/bin/bash
iwlist wlan0 scan | grep ESSID
iwconfig wlan0 essid $NETWORKNAME key s:$WIRELESSKEY
dhclient wlan0

#!/bin/bash
wpapassphrase $SSID $PASSWORD
vim /etc/wpasupplicant.conf
#Network = #my other } doesn't work neither does underscore
#	ssid=SSID
#	psk=PSK 
wpasupplicant B i $INTERFACE DWext c /etc/wpasupplicant.conf
iwconfig INTERFACE
dhcclient INTERFACE
#automation by edit >> /etc/network/interfaces
