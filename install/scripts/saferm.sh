# !/bin/bash

RMCMD=/bin/rm
MVCMD=/bin/mv

if [ ! -d ~/.Trash ]; then
    mkdir ~/.Trash
    chmod -R 666 ~/.Trash
fi

ctrlargs=""
args=""
force="no"
clean="no"
until [ $# -eq 0 ]
do
    arg=$1
    if [ "$arg" = "-f" ]; then
        force="yes"
    elif [ "$arg" = "-c" ]; then
        clean="yes"
    else
        ctrlargs="$ctrlargs $arg"
    fi
    shift
done

if [ $clean = "yes" ]; then
    echo -n "\033[41;37mThis operation may cause the file to be lost!! Are you sure clean the trash?(y/n)\033[0m:"
    read ipt
    if [ ! $ipt = "y" ] && [ ! $ipt = "" ]; then
        echo "Type Error, operation canceled!"
    else
        /bin/rm -rf ~/.Trash/*
        echo "The trash cleaned!"
    fi
    exit 0
fi

if [ $force = "yes" ]; then
    $RMCMD $ctrlargs $args
    exit 0
fi
