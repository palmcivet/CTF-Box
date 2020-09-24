# !/bin/bash

apt update && apt install -y --no-install-recommends \
    libffi-dev build-essential

# PEDA
git clone --depth=1 https://github.com/zachriggle/peda ${TOOL}/peda

# Pwndbg
git clone --depth=1 https://github.com/pwndbg/pwndbg ${TOOL}/pwndbg
bash ${TOOL}/pwndbg/setup.sh

# GEF
mkdir ${TOOL}/gef
curl -fsSL https://github.com/hugsy/gef/raw/master/gef.py > ~/HACK/tool/gef/gef.py

echo "source ${TOOL}/gef/gef.py" > ~/.gdbinit

# Radare2
git clone --depth=1 https://github.com/radare/radare2.git ${TOOL}/radare2
bash ${TOOL}/radare2/sys/install.sh

python3 -m pip install --upgrade \
    angr \
    git+https://github.com/Gallopsled/pwntools.git@dev

clear.sh