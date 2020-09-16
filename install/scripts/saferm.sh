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
    if [ "${arg:0:1}"x != "-"x ]; then
        args="$args $arg"
    elif [ "$arg" = "-force" ]; then
        force="yes"
    elif [ "$arg" = "-clean" ]; then
        clean="yes"
    else
        ctrlargs="$ctrlargs $arg"
    fi
    shift
done

if [ $clean = "yes" ]; then
        echo -n -e "\033[41;37m This operation may cause the file to be lost!! Are you sure clean the trash?\033[0m yes/no :"
    read ipt
    while [[ ! $ipt = "yes" ]] && [[ ! $ipt = "no" ]]; do
        echo -n -e "\033[41;37mType Error, Retype please !\033[0m yes/no :"
        read ipt
    done
    if [ $ipt = "yes" ]; then
        /bin/rm -rf ~/.Trash/*
        echo "The trash cleaned!"
    fi
    exit 0
fi

if [ $force = "yes" ]; then
$RMCMD $ctrlargs $args
exit 0
fi


if [ `uname` = "Darwin" ]; then
    $MVCMD -v -f $args ~/.Trash
else
    $MVCMD -v -f --backup=numbered $args ~/.Trash
fi