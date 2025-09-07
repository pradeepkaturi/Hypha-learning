#!/bin/bash

# Default refresh rate
REFRESH=2

# Function to get CPU usage
get_cpu_usage() {
    PREV=($(grep '^cpu ' /proc/stat))
    PREV_IDLE=${PREV[4]}
    PREV_TOTAL=0
    for val in "${PREV[@]:1}"; do
        PREV_TOTAL=$((PREV_TOTAL + val))
    done

    sleep 0.5

    CURR=($(grep '^cpu ' /proc/stat))
    CURR_IDLE=${CURR[4]}
    CURR_TOTAL=0
    for val in "${CURR[@]:1}"; do
        CURR_TOTAL=$((CURR_TOTAL + val))
    done

    IDLE_DIFF=$((CURR_IDLE - PREV_IDLE))
    TOTAL_DIFF=$((CURR_TOTAL - PREV_TOTAL))
    CPU_USAGE=$(( (100 * (TOTAL_DIFF - IDLE_DIFF)) / TOTAL_DIFF ))
    echo "$CPU_USAGE"
}

# Function to get memory usage
get_mem_usage() {
    MEM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    MEM_AVAILABLE=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    MEM_USED=$((MEM_TOTAL - MEM_AVAILABLE))
    MEM_USAGE=$((100 * MEM_USED / MEM_TOTAL))
    echo "$MEM_USAGE"
}

# Function to get network usage
get_net_usage() {
    IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')
    RX1=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $2}')
    TX1=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $10}')
    sleep 1
    RX2=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $2}')
    TX2=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $10}')
    RX_RATE=$(( (RX2 - RX1) / 1024 ))
    TX_RATE=$(( (TX2 - TX1) / 1024 ))
    echo "$IFACE RX: ${RX_RATE}KB/s TX: ${TX_RATE}KB/s"
}

# Function to show refresh rate input box
change_refresh_rate() {
    RATE=$(dialog --inputbox "Enter refresh rate in seconds:" 8 40 "$REFRESH" 3>&1 1>&2 2>&3)
    if [[ "$RATE" =~ ^[0-9]+$ ]] && [ "$RATE" -ge 1 ]; then
        REFRESH=$RATE
    else
        dialog --msgbox "Invalid input. Refresh rate unchanged." 6 40
    fi
}

# Function to display metrics with gauges
display_metrics() {
    MODE=$1
    while true; do
        CPU=$(get_cpu_usage)
        MEM=$(get_mem_usage)
        NET=$(get_net_usage)

        {
            [ "$MODE" = "All" ] || [ "$MODE" = "CPU" ] && echo "XXX"; echo "$CPU"; echo "CPU Usage"; echo "XXX"
            sleep 0.1
            [ "$MODE" = "All" ] || [ "$MODE" = "Memory" ] && echo "XXX"; echo "$MEM"; echo "Memory Usage"; echo "XXX"
            sleep 0.1
        } | dialog --title "System Monitor ($MODE)" --gauge "$NET" 12 70 0

        sleep "$REFRESH"
    done
}

# Main menu loop
while true; do
    CHOICE=$(dialog --clear --title "Interactive Resource Monitor" \
        --menu "Choose an option:" 15 50 6 \
        1 "Show All Metrics" \
        2 "Show CPU Only" \
        3 "Show Memory Only" \
        4 "Change Refresh Rate ($REFRESH sec)" \
        5 "Exit" \
        3>&1 1>&2 2>&3)

    case $CHOICE in
        1) display_metrics "All" ;;
        2) display_metrics "CPU" ;;
        3) display_metrics "Memory" ;;
        4) change_refresh_rate ;;
        5) clear; exit 0 ;;
        *) dialog --msgbox "Invalid option." 6 30 ;;
    esac
done
