# !/bin/bash
echo "[*] Clean packages..." && apt autoremove && apt autoclean
echo "[*] Sync disk" && sync
echo "[*] Clearing logs..." \
    && find /var/log/ -mtime +20 -name "*.log" | xargs rm -f \
    && echo "" > /var/log/messages \
    && echo "" > /var/log/syslog
echo "[*] Clear completed!"
