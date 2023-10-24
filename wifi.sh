#!/bin/bash

# 󰤨  󰤥  󰤦  󰤧  󰤩  󰤪  󰤭  󰤟  󰤠  󰤡  󰤢  󰤣  󰤤 

WIFI_STATE=$(ip link | grep $)

case $WIFI_STATE in
	"") echo 󰤨  ;;
	"DOWN") echo 󰤭 ;;
esac

echo $WIFI_STATE





