#!/bin/bash

echo "===== Server Performance Stats ====="

# Total CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "[+] CPU Usage: $CPU_USAGE%"

# Total Memory Usage
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")
echo "[+] Memory Usage: $MEM_USED MB / $MEM_TOTAL MB ($MEM_PERCENT%)"

# Total Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $3}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}')
echo "[+] Disk Usage: $DISK_USAGE / $DISK_TOTAL ($DISK_PERCENT free)"

# Top 5 Processes by CPU Usage
echo "[+] Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
echo "[+] Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Stretch Goal: Additional System Information
echo "===== Additional System Info ====="
echo "[+] OS Version: $(lsb_release -d | cut -f2-)"
echo "[+] Uptime: $(uptime -p)"
echo "[+] Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "[+] Logged-in Users: $(who | wc -l)"
echo "[+] Failed Login Attempts: $(journalctl _SYSTEMD_UNIT=sshd.service | grep 'Failed password' | wc -l)"
