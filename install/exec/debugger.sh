#!/bin/bash

check_proc() {
    res=`ps -ef | grep -w $1 | grep -v grep | wc -l`
    if [ 0 = $res ]; then
        $1 $2 &
    fi
}

check_proc linux_server -p${PORT_32}
check_proc linux_server64 -p${PORT_64}
