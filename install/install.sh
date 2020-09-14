# !/usr/bin/env bash

ENV="SEC"

mkdir ~/${ENV}

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
if [ $1 = true ]; then
    apt-get install -y --no-install-recommends \
        binwalk \
        pcapfix \
        foremost \
        steghide \
        pngcheck \
        outguess \
        multimon-ng
fi

# binary
apt-get install -y --no-install-recommends \
    ncat \
    gcc \
    gdb

python3 -m pip install --upgrade pip
python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev
python3 -m pip install virtualenvwrapper

# IDA Pro debugger
cp -rf ./debug ~/debug

# tools from GitHub
cd ~/${ENV}
git clone https://github.com/zachriggle/peda
echo "source ~/${ENV}/peda/peda.py" >> ~/.gdbinit

# clean cache
apt-get autoclean \
    && apt-get autoremove
