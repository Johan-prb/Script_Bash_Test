#!/bin/bash

# Memastikan iptables terinstal
if ! command -v iptables &> /dev/null; then
    echo "iptables tidak terinstal. Script dihentikan."
    exit 1
fi

# Membersihkan aturan iptables yang ada
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Mengizinkan semua koneksi keluar
iptables -P OUTPUT ACCEPT

# Menolak semua koneksi masuk
iptables -P INPUT DROP

# Mengizinkan koneksi masuk ke port 22 (SSH)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Mengizinkan koneksi masuk ke port 80 (HTTP)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Mengizinkan koneksi masuk ke port 443 (HTTPS)
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Mengizinkan koneksi masuk untuk penerusan (forwarding)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Mengizinkan koneksi loopback
iptables -A INPUT -i lo -j ACCEPT

echo "Aturan firewall berhasil dikonfigurasi."
