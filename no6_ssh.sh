#!/bin/bash

if [ -z "$1" ]; then
    echo "Penggunaan: $0 <direktori_tujuan>"
    exit 1
fi

target_dir="$1"

if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
fi

ssh-keygen -t rsa -b 4096 -f "$target_dir/id_rsa" -N "" -C "SSH Key $(date +%Y-%m-%d)"

if [ $? -eq 0 ]; then
    echo "SSH Key berhasil dibuat dan disimpan di $target_dir"
    echo "File public key: $target_dir/id_rsa.pub"
    echo "File private key: $target_dir/id_rsa"
else
    echo "Terjadi kesalahan saat membuat SSH Key."
    exit 1
fi
