#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
# date  '+%Y-%m-%d %H:%M:%S' 2020-11-19 17:48:10
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s" "$(date  '+%H:%M')"
    else
        printf "DAT %s" "$(date  '+%H:%M')"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
