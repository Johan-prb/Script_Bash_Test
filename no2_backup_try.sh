#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <direktori_sumber> <lokasi_backup>"
    exit 1
fi

sumber_dir="$1"
backup_dir="$2"

if [ ! -d "$sumber_dir" ]; then
    echo "Direktori sumber $sumber_dir tidak ada."
    exit 1
fi

if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

backup_file="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
backup_path="$backup_dir/$backup_file"

tar -czf "$backup_path" -C "$sumber_dir" .

if [ $? -eq 0 ]; then
    echo "Backup direktori $sumber_dir berhasil disimpan di $backup_path"
else
    echo "Terjadi kesalahan dalam proses backup."
    exit 1
fi
