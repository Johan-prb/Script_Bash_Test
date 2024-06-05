#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <direktori> <ekstensi_file>"
    exit 1
fi

direktori="$1"
ekstensi_file="$2"

if [[ "$ekstensi_file" != .* ]]; then
    ekstensi_file=".$ekstensi_file"
fi

files=$(find "$direktori" -type f -name "*$ekstensi_file")

if [ -z "$files" ]; then
    echo "Tidak ada file yang ditemukan dengan ekstensi $ekstensi_file dalam direktori $direktori."
else
    echo "File dengan ekstensi $ekstensi_file yang ditemukan dalam direktori $direktori:"
    printf "%s\n" "$files"
fi
