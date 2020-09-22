# !/bin/bash

apt update && apt install -y --no-install-recommends \
    libffi-dev build-essential

# PEDA
git clone --depth=1 https://github.com/zachriggle/peda ${TOOL}/peda
echo "source ${TOOL}/peda/peda.py" >> ~/.gdbinit

# Pwndbg
git clone --depth=1 https://github.com/pwndbg/pwndbg ${TOOL}/pwndbg
bash ${TOOL}/pwndbg/setup.sh

# GEF
sh -c "$(curl -fsSL http://gef.blah.cat/sh)"

# Radare2
git clone --depth=1 https://github.com/radare/radare2.git ${TOOL}/radare2
bash ${TOOL}/radare2/sys/install.sh

python3 -m pip install --upgrade \
    angr \
    git+https://github.com/Gallopsled/pwntools.git@dev
