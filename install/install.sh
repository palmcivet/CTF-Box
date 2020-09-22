# !/bin/bash

# tools from package repository
apt-get install -y --no-install-recommends \
    apt-utils \
    python3-pip \
    python3-dev \
    sudo \
    curl \
    zsh \
    git \
    vim \
    binwalk \
    pcapfix \
    foremost \
    steghide \
    pngcheck \
    outguess \
    imagemagick \
    multimon-ng \
    python3-gmpy2 \
    gcc \
    gdb \
    ncat \
    ltrace \
    gdb-multiarch

# pip
python3 -m pip install --upgrade pip
mkdir ~/.pip
cp ./config/pip.conf ~/.pip/pip.conf

# configure oh-my-zsh theme
chmod 755 ./oh-my-zsh.sh \
    && ./oh-my-zsh.sh
rm ~/.oh-my-zsh/themes/*
cp ./config/gnzh.zsh-theme ~/.oh-my-zsh/themes/gnzh.zsh-theme
cp ./config/zshrc ~/.zshrc
chsh -s /bin/zsh root
touch ~/.z

# toolbox
ROOT=HACK
EXEC=~/${ROOT}/exec
DEBUG=~/${ROOT}/debug

# debugger
mkdir -p ${EXEC} ${DEBUG}
cp -rf ./debug ${DEBUG}

echo "export PATH=${EXEC}:${PATH}" >> ~/.zshrc
echo "export TOOL=${ROOT}/tool" >> ~/.zshrc

# eg. link_exec clear.sh clear
link_exec() {
    cp ./scripts/${1} ${EXEC}/${1}
    chmod 755 ${EXEC}/${1}
    echo "alias ${2}=\"${EXEC}/${1}\"" >> ~/.zshrc
}

# link scripts to command
link_exec clear.sh clear
link_exec saferm.sh rm
link_exec trid trid
cp ./custom.sh ~/${ROOT}/custom.sh
chmod 755 ~/${ROOT}/custom.sh

# fix timezone
ln -fs /usr/share/zoneinfo/Asiz/Shanghai /etc/localtime

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

# welcome
echo '' >> ~/.zshrc
echo 'echo -e " ::\   ::\                     ::\          ::::::::\                  ::\  "' >> ~/.zshrc
echo 'echo -e " :: |  :: |                    :: |         ::  _____|                 :: | "' >> ~/.zshrc
echo 'echo -e " :: |  :: | ::::::\   :::::::\ :: |  ::\    :: |   ::\   ::\ :::::::\  :: | "' >> ~/.zshrc
echo 'echo -e " :::::::: | \____::\ ::  _____|:: | ::  |   :::::\ :: |  :: |::  __::\ :: | "' >> ~/.zshrc
echo 'echo -e " ::  __:: | ::::::: |:: /      ::::::  /    ::  __|:: |  :: |:: |  :: |\__| "' >> ~/.zshrc
echo 'echo -e " :: |  :: |::  __:: |:: |      ::  _::<     :: |   :: |  :: |:: |  :: |     "' >> ~/.zshrc
echo 'echo -e " :: |  :: |\::::::: |\:::::::\ :: | \::\    :: |   \::::::  |:: |  :: |::\  "' >> ~/.zshrc
echo 'echo -e " \__|  \__| \_______| \_______|\__|  \__|   \__|    \______/ \__|  \__|\__| "' >> ~/.zshrc
echo '' >> ~/.zshrc
echo 'cd ~' >> ~/.zshrc
