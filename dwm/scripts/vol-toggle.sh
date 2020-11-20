#!/bin/bash

amixer -D pulse sset Master toggle
bash ~/.dwm/dwm-status-show-tool.sh
