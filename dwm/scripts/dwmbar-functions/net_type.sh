#!/bin/bash

net_type_icon(){
    NETTYPE="$(nmcli device status | grep -e '\sconnected\s' | sed 's/  */ /g' | sed -n '1p' | cut -d ' ' -f 2)"
    if [ $NETTYPE = "wifi" ];then
	printf "📶"
    elif [ $NETTYPE = "ethernet" ];then
	printf "🌐"
    else
	printf " ❎"
    fi
}

net_name() {
    printf "$(nmcli device status | grep -e '\sconnected\s' | sed 's/  */ /g' | sed -n '1p' | cut -d ' ' -f 4)"
}

print_net_type(){
    printf "$(net_type_icon) $(net_name)"
}

