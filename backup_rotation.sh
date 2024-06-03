#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <direktori_sumber> <direktori_backup>"
    exit 1
fi

src_dir="$1"
backup_dir="$2"

if [ ! -d "$src_dir" ]; then
    echo "Direktori sumber $src_dir tidak ada."
    exit 1
fi

if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

backup_file="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
backup_path="$backup_dir/$backup_file"

tar -czf "$backup_path" -C "$src_dir" .

if [ $? -eq 0 ]; then
    echo "Backup direktori $src_dir berhasil disimpan di $backup_path"
else
    echo "Terjadi kesalahan dalam proses backup."
    exit 1
fi

find "$backup_dir" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup yang lebih lama dari 7 hari telah dihapus."
