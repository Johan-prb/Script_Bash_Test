#!/bin/bash

# Membuat direktori netplan jika belum ada
sudo mkdir -p /etc/netplan

# Membuat file konfigurasi netplan
sudo tee /etc/netplan/01-netcfg.yaml > /dev/null << EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF

# Menerapkan perubahan konfigurasi
sudo netplan apply

echo "Konfigurasi jaringan dengan netplan telah selesai."
