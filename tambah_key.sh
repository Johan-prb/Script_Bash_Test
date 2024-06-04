#!/bin/bash

# Periksa jumlah argumen
if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <file_public_key> <username>"
    exit 1
fi

public_key_file="$1"
username="$2"

if [ ! -f "$public_key_file" ]; then
    echo "File public key $public_key_file tidak ditemukan."
    exit 1
fi

if [ ! -d "/home/$username/.ssh" ]; then
    mkdir -p "/home/$username/.ssh"
fi

cat "$public_key_file" >> "/home/$username/.ssh/authorized_keys"

if [ $? -eq 0 ]; then
    echo "Public key berhasil ditambahkan ke /home/$username/.ssh/authorized_keys."
else
    echo "Terjadi kesalahan saat menambahkan public key ke /home/$username/.ssh/authorized_keys."
    exit 1
fi
