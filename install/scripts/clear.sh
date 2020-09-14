#!/bin/bash
apt autoremove
apt autoclean
sync
echo "[+] Sync disk"

echo "[+] Clearing logs..."
echo 3 > /proc/sys/vm/drop_caches
find /var/log/ -mtime +20 -name "*.log" | xargs rm -f
echo "" > /var/log/messages
echo "" > /var/log/syslog
echo "[+] Clear completed!"
