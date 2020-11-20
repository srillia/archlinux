#!/bin/bash

first_level=20

second_level=10

first_level_sounds_played=false

second_level_sounds_played=false

sound_dir="~/.dwm/voice/no-power.wav"

get_battery_combined_percent() {

	# get charge of all batteries, combine them
	total_charge=$(expr $(acpi -b | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc));

	# get amount of batteries in the device
	battery_number=$(acpi -b | wc -l);
    
	percent=$(expr $total_charge / $battery_number);
	echo $percent;
}

#获取电量水平：0、正常 1、较低 3、很低
get_power_level() {
    if [ $(get_battery_combined_percent) -le $first_level ] && [ $(get_battery_combined_percent) -gt $second_level ]
    then
	echo 1
    elif [ $(get_battery_combined_percent) -le $second_level ]
    then
	echo 2
    else
	echo 0
    fi
}

for((;;))
do
    level=$(get_power_level)
    if [ $level == 1 ]
    then
	if [ $first_level_sounds_played == false ]
	then
    	    first_level_sounds_played=true
	    eval "aplay $sound_dir"
	fi
	second_level_sounds_played=false
    elif [ $level == 2 ]
    then
	if [ $second_level_sounds_played == false ]
	then
    	    second_level_sounds_played=true
	    eval "aplay $sound_dir"
	fi
	first_level_sounds_played=false
    else
	first_level_sounds_played=false
	second_level_sounds_played=false
    fi
    sleep 60
done
