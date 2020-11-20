#!/bin/bash

#ibus input method
ibus-daemon -x -r -d
# 状态栏显示设置
/bin/bash ~/.dwm/dwm-status-refresh-task.sh &
# 电力监控提示音
/bin/bash ~/.dwm/power-watcher.sh &
# 背景图片设置
feh --bg-scale ~/Documents/bg1.jpg
# 开启触摸板点击功能
#/bin/bash ~/.dwm/tap-to-click.sh
# xcompmgr &
picom -b
# shadowsocks-qt5
ss-qt5
# 开启数字键盘
numlockx on
