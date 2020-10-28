#!/bin/bash

echo "[+] Clean packages..." && apt autoremove && apt autoclean
echo "[+] Sync disk" && sync
echo "[+] Clearing logs..." \
    && find /var/log/ -mtime +0 -name "*.log" | xargs rm -f \
    && echo "" > /var/log/messages \
    && echo "" > /var/log/syslog
echo "[+] Clearing cache..." \
    && sudo rm -r /var/lib/apt/lists/* \
    && sudo rm -r /var/log/apt \
    && sudo rm -r ~/.cache \
    && sudo rm -r ~/.Trash \
    && sudo rm -r ~/.pip
echo "[+] Clearing history..." \
    && sudo rm .zsh_history \
    && sudo rm .gdb_history \
    && sudo rm .python_history
echo "[+] Clear completed!"
