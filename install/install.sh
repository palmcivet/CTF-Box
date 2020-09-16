# !/usr/bin/env bash

GIT="tools"
WORK="work"
DEBUG="debugger"
SCRIPT="scripts"

mkdir ~/${GIT} ~/${WORK} ~/${DEBUG} ~/${SCRIPT}

# support i386
dpkg --add-architecture i386

# package manager
cp config/sources.list /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade

# basic setting
apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    apt-utils \
    sudo \
    curl \
    zsh \
    git \
    vim

# configure oh-my-zsh theme
chmod 755 ./oh-my-zsh.sh \
    && ./oh-my-zsh.sh
rm -f ~/.oh-my-zsh/themes/*
cp -f ./config/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
cp ./config/zshrc ~/.zshrc
chsh -s /bin/zsh root
touch ~/.z

# fix timezone
ln -fs /usr/share/zoneinfo/Asiz/Shanghai /etc/localtime

# CTF tools
# apt-get install -y --no-install-recommends \
#     binwalk \
#     pcapfix \
#     foremost \
#     steghide \
#     pngcheck \
#     outguess \
#     multimon-ng

# binary
apt-get install -y --no-install-recommends \
    ncat \
    gcc \
    gdb

# python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev
python3 -m pip install virtualenvwrapper

# IDA Pro debugger
cp -rf ./debug ~/${DEBUG}

# tools from GitHub
# cd ~/${GIT}
# git clone https://github.com/zachriggle/peda
# echo "source ~/${GIT}/peda/peda.py" >> ~/.gdbinit

# clean cache
apt-get autoclean \
    && apt-get autoremove \
    && sync
echo "" > /var/log/messages
echo "" > /var/log/syslog
find /var/log/ -name "*.log" | xargs rm -f
rm -r /var/log/apt
rm -r ~/.cache
