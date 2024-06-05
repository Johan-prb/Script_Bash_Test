#!/bin/bash

if [ -z "$1" ]; then
    echo "Penggunaan: $0 <direktori>"
    exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
    echo "Direktori $dir tidak ada."
    exit 1
fi

echo "+----------------------------+----------+----------+----------+"
echo "| Nama File                  | Baris    | Kata     | Karakter |"
echo "+----------------------------+----------+----------+----------+"

for file in "$dir"/*.sh; do
    if [ -f "$file" ]; then

        lines=$(wc -l < "$file")
        words=$(wc -w < "$file")
        chars=$(wc -m < "$file")

        printf "| %-26s | %8d | %8d | %8d |\n" "$(basename "$file")" "$lines" "$words" "$chars"
    fi
done

echo "+----------------------------+----------+----------+----------+"
