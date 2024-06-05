#!/bin/bash
# Lokasi file log
log_file="/var/log/cpu_monitor.log"

# Fungsi untuk mendapatkan penggunaan CPU rata-rata dalam 1 menit
get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "$cpu_usage"
}

# Fungsi untuk mencatat log
log_usage() {
    cpu_usage=$1
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$timestamp - CPU usage: $cpu_usage%" >> "$log_file"
}

# Loop untuk memonitor penggunaan CPU
while true; do
    cpu_usage=$(get_cpu_usage)

    # Cek apakah penggunaan CPU di atas 75%
    if (( $(echo "$cpu_usage" | tr -d '%' | awk '{print $1}') > 75 )); then
        log_usage "$cpu_usage"
    fi

    # Jeda selama 1 menit
    sleep 60
done
