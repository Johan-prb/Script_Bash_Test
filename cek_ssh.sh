#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <username> <ip_server>"
    exit 1
fi

username="$1"
server_ip="$2"

ssh -o BatchMode=yes -o ConnectTimeout=5 "$username@$server_ip" "exit 0" 2>/dev/null

ssh_status=$?

if [ $ssh_status -eq 0 ]; then
    echo "Koneksi SSH ke server $server_ip dengan user $username berhasil."
else
    echo "Koneksi SSH ke server $server_ip dengan user $username gagal."
fi

exit $ssh_status
