# !/usr/bin/bash

SEC=SEC

WORK=~/work
TOOL=~/${SEC}/tools
ADDON=~/${SEC}/addon
DEBUG=~/${SEC}/debug
WORKON_HOME=~/${SEC}/ENV

apt-get install -y --no-install-recommends \
    binwalk \
    pcapfix \
    foremost \
    steghide \
    pngcheck \
    outguess \
    multimon-ng \
    gcc \
    gdb \
    ncat \
    ltrace \
    gdb-multiarch \
    libffi-dev build-essential \
    m4 libgmp-dev libmpfr-dev libmpc-dev

# debugger
mkdir -p ${WORK} ${TOOL} ${ADDON} ${DEBUG} ${WORKON_HOME}
cp -rf ./debug/ ${DEBUG}

# tools from GitHub
git clone --depth=1 https://github.com/zachriggle/peda ${TOOL}/peda
echo "source ${TOOL}/peda/peda.py" >> ~/.gdbinit

git clone --depth=1 https://github.com/radare/radare2.git ${TOOL}/radare2
bash ${TOOL}/radare2/sys/install.sh

python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev
python3 -m pip install \
    z3-solver \
    gmpy
