#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Penggunaan: $0 <start|stop|status> <nama_service>"
    exit 1
fi

action="$1"
service_name="$2"

start_service() {
    systemctl start "$service_name"
    if [ $? -eq 0 ]; then
        echo "Service $service_name berhasil dimulai."
    else
        echo "Gagal memulai service $service_name."
    fi
}

stop_service() {
    systemctl stop "$service_name"
    if [ $? -eq 0 ]; then
        echo "Service $service_name berhasil dihentikan."
    else
        echo "Gagal menghentikan service $service_name."
    fi
}

check_status() {
    systemctl is-active --quiet "$service_name"
    if [ $? -eq 0 ]; then
        echo "Service $service_name sedang berjalan."
    else
        echo "Service $service_name tidak berjalan."
    fi
}

case "$action" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    status)
        check_status
        ;;
    *)
        echo "Tindakan tidak dikenali: $action"
        echo "Penggunaan: $0 <start|stop|status> <nama_service>"
        exit 1
        ;;
esac
