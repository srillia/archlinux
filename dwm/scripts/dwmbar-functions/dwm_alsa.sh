#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

mute_status() {
    if [ $1 = "on" ]; then
	printf "$2 "
    else
	printf "🔇 "
    fi
}

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    mute="$(amixer get Master | sed -n '$p' | cut -d] -f3 | cut -d[ -f2)"
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
#	    printf "🔈 %s%%" '$VOL'
            printf "%s%s" "$(mute_status ${mute} 🔈)$VOL%"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
#            printf "🔉 %s%%" "$VOL"
	    printf "%s%s" "$(mute_status ${mute} 🔉)$VOL%"
        else
#            printf "🔊 %s%%" "$VOL"
	    printf "%s%s" "$(mute_status ${mute} 🔊)$VOL%"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}
