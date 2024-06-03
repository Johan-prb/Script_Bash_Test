#!/bin/bash

if command -v apt-get >/dev/null 2>&1; then
    package_manager="apt-get"
elif command -v yum >/dev/null 2>&1; then
    package_manager="yum"
elif command -v dnf >/dev/null 2>&1; then
    package_manager="dnf"
else
    echo "Package manager tidak ditemukan. Script hanya berjalan pada distribusi Linux berbasis Debian, Red Hat, atau Fedora."
    exit 1
fi

log_file="update_$(date +%Y%m%d_%H%M%S).log"

echo "Memperbarui daftar paket..." >> "$log_file"
case "$package_manager" in
    "apt-get")
        apt-get update >> "$log_file" 2>&1
        ;;
    "yum")
        yum check-update >> "$log_file" 2>&1
        ;;
    "dnf")
        dnf check-update >> "$log_file" 2>&1
        ;;
esac

echo "Memperbarui paket..." >> "$log_file"
case "$package_manager" in
    "apt-get")
        apt-get upgrade -y >> "$log_file" 2>&1
        ;;
    "yum")
        yum upgrade -y >> "$log_file" 2>&1
        ;;
    "dnf")
        dnf upgrade -y >> "$log_file" 2>&1
        ;;
esac

echo "Pembaharuan sistem selesai. Log tersimpan di $log_file"
