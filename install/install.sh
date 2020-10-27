# !/bin/bash

# tools from package repository
apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    proxychains4 \
    sudo \
    ruby \
    file \
    wget \
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
    exiftool \
    imagemagick \
    multimon-ng \
    python3-gmpy2 \
    gcc \
    gdb \
    ncat \
    ltrace \
    gdbserver \
    gdb-multiarch \
    libstdc++6:i386

# pip
python3 -m pip install --upgrade \
    pip \
    numpy \
    Pillow \
    opencv-python
mkdir ~/.pip
cp ./config/pip.conf ~/.pip/pip.conf

# fix timezone
ln -fs /usr/share/zoneinfo/Asiz/Shanghai /etc/localtime

# configure oh-my-zsh theme
chmod +x ./oh-my-zsh.sh \
    && bash ./oh-my-zsh.sh
rm ~/.oh-my-zsh/themes/*
cp ./config/gnzh.zsh-theme ~/.oh-my-zsh/themes/gnzh.zsh-theme
cp ./config/zshrc ~/.zshrc
chsh -s /bin/zsh root
touch ~/.z

# define directories
ROOT=HACK
WORK=~/work
FILE=~/file
EXEC=~/${ROOT}/exec
TOOL=~/${ROOT}/tool

mkdir -p ${WORK} ${FILE} ${EXEC} ${TOOL}

echo "export PATH=${FILE}:${EXEC}:${PATH}" >> ~/.zshrc
echo "export TOOL=~/${TOOL}" >> ~/.zshrc
echo "export python3=`which python3`" >> ~/.zshrc

# link rm command
cp -Rf ./exec/* ${EXEC}
chmod +x ${EXEC}/*
echo "alias rm=\"${EXEC}/saferm.sh\"" >> ~/.zshrc

cp ./custom.sh ~/${ROOT}/custom.sh
chmod +x ~/${ROOT}/custom.sh

# clean cache
bash ${EXEC}/clear.sh

# schedule tasks
echo "bash debugger.sh" >> ~/.zshrc

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
echo "cd ${WORK}" >> ~/.zshrc
