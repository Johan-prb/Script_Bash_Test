#!/bin/bash

# Periksa jumlah argumen
if [ "$#" -ne 3 ]; then
    echo "Penggunaan: $0 <file_public_key> <username> <ip_server>"
    exit 1
fi

# Simpan argumen ke dalam variabel
public_key_file="$1"
username="$2"
server_ip="$3"

if [ ! -f "$public_key_file" ]; then
    echo "File public key $public_key_file tidak ditemukan."
    exit 1
fi

ssh "$username@$server_ip" "mkdir -p ~/.ssh"

cat "$public_key_file" | ssh "$username@$server_ip" "cat >> ~/.ssh/authorized_keys"

# Periksa
if [ $? -eq 0 ]; then
    echo "Public key berhasil disalin ke server $server_ip."
else
    echo "Terjadi kesalahan saat menyalin public key ke server $server_ip."
    exit 1
fi
