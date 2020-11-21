#!/bin/bash
function dwm_mem_free() {
    freeMem=`free -mh | grep Mem | awk '{print $7}'`
    usedMem=`free -mh | grep Mem | awk '{print $3}'`
    mem=$usedMem/$freeMem
    printf "%s" "${mem//i/}"
}
dwm_mem_free

