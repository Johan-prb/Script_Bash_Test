#!/bin/bash

# Mendapatkan nama host
hostname=$(hostname)

# Mendapatkan waktu sistem saat ini
current_time=$(date)

# Mendapatkan jumlah pengguna yang sedang login
logged_users=$(who | wc -l)

# Menampilkan informasi sistem
echo "Informasi Sistem:"
echo "Nama Host: $hostname"
echo "Waktu Sistem Saat Ini: $current_time"
echo "Jumlah Pengguna yang Sedang Login: $logged_users"
