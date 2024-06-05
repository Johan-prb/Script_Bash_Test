#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <string_unik> <username>"
    exit 1
fi

unique_string="$1"
username="$2"

auth_keys_file="/home/$username/.ssh/authorized_keys"
if [ ! -f "$auth_keys_file" ]; then
    echo "File authorized_keys tidak ditemukan untuk user $username."
    exit 1
fi

temp_file=$(mktemp)

grep -v "$unique_string" "$auth_keys_file" > "$temp_file"

if cmp -s "$auth_keys_file" "$temp_file"; then
    echo "Tidak ada public key yang dihapus dari authorized_keys untuk user $username."
else
    mv "$temp_file" "$auth_keys_file"
    echo "Public key yang mengandung string '$unique_string' berhasil dihapus dari authorized_keys untuk user $username."
fi

rm -f "$temp_file"
