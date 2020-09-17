# !/usr/bin/bash

# support i386
dpkg --add-architecture i386

# package manager
cp config/sources.list /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade

# essential tools
apt-get install -y --no-install-recommends \
    sudo \
    apt-utils \
    python3-pip \
    python3-dev \
    curl \
    zsh \
    git \
    vim

# pip
python3 -m pip install --upgrade pip
mkdir ~/.pip
cp ./config/pip.conf ~/.pip/pip.conf

# configure oh-my-zsh theme
chmod 755 ./oh-my-zsh.sh \
    && ./oh-my-zsh.sh
rm ~/.oh-my-zsh/themes/*
cp ./config/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
cp ./config/zshrc ~/.zshrc
chsh -s /bin/zsh root
touch ~/.z

# fix timezone
ln -fs /usr/share/zoneinfo/Asiz/Shanghai /etc/localtime

# link scripts to command
cp ./scripts/clear.sh /usr/local/bin/clear
cp ./scripts/saferm.sh /usr/local/bin/saferm
chmod 755 /usr/local/bin/clear
chmod 755 /usr/local/bin/saferm
echo 'alias clear="/usr/local/bin/clear"' >> ~/.zshrc
echo 'alias rm="/usr/local/bin/saferm"' >> ~/.zshrc

# security tools
chmod 755 ./security.sh \
    && ./security.sh

echo "cd ~" >> ~/.zshrc
echo 'echo "Hack Fun!"' >> ~/.zshrc

# clean cache
apt-get autoclean \
    && apt-get autoremove \
    && sync
echo "" > /var/log/messages
echo "" > /var/log/syslog
find /var/log/ -name "*.log" | xargs rm -f
rm -r /var/lib/apt/lists/*
rm -r /var/log/apt
rm -r ~/.cache
