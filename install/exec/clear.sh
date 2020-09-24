#!/bin/bash

echo "[+] Clean packages..." && apt autoremove && apt autoclean
echo "[+] Sync disk" && sync
echo "[+] Clearing logs..." \
    && find /var/log/ -mtime +0 -name "*.log" | xargs rm -f \
    && echo "" > /var/log/messages \
    && echo "" > /var/log/syslog
echo "[+] Clearing cache..." \
    && rm -r /var/lib/apt/lists/* \
    && rm -r /var/log/apt \
    && rm -r ~/.cache \
    && rm -r ~/.Trash \
    && rm -r ~/.pip
echo "[+] Clearing history..." \
    && rm zsh_history \
    && rm gdb_history
echo "[+] Clear completed!"
