#!/bin/bash

#Interactive System Resource Monitor (Graphical): Write a script that monitors CPU, memory, and network usage. Utilize libraries like ncurses to display them in a user-configurable graphical format (e.g., bar charts, gauges). Allow users to choose the refresh rate and potentially switch between different display modes

# Set defaults
REFRESH=2
MODE="All"

# Terminal size check
ROWS=$(tput lines)
COLS=$(tput cols)

# Bar chart rendering function
draw_bar() {
    local value=$1
    local max=$2
    local label=$3
    local width=$((COLS - 20))
    local bar_length=$((value * width / max))
    local bar=$(printf "%0.s█" $(seq 1 $bar_length))
    printf "%-10s |%-*s| %3d%%\n" "$label" "$width" "$bar" "$value"
}

# CPU Usage function
get_cpu_usage() {
    PREV_IDLE=$(grep 'cpu ' /proc/stat | awk '{print $5}')
    PREV_TOTAL=$(grep 'cpu ' /proc/stat | awk '{print $2+$3+$4+$5+$6+$7+$8}')
    sleep 0.5
    IDLE=$(grep 'cpu ' /proc/stat | awk '{print $5}')
    TOTAL=$(grep 'cpu ' /proc/stat | awk '{print $2+$3+$4+$5+$6+$7+$8}')
    DIFF_IDLE=$((IDLE - PREV_IDLE))
    DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
    DIFF_USAGE=$((100 * (DIFF_TOTAL - DIFF_IDLE) / DIFF_TOTAL))
    echo "$DIFF_USAGE"
}

# Memory Usage function
get_memory_usage() {
    MEM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    MEM_AVAILABLE=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    MEM_USED=$((MEM_TOTAL - MEM_AVAILABLE))
    MEM_USAGE=$((100 * MEM_USED / MEM_TOTAL))
    echo "$MEM_USAGE"
}

# Network Usage function
get_network_usage() {
    IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')
    RX1=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $2}')
    TX1=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $10}')
    sleep 1
    RX2=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $2}')
    TX2=$(cat /proc/net/dev | grep "$IFACE" | awk '{print $10}')
    RX_RATE=$(( (RX2 - RX1) / 1024 ))
    TX_RATE=$(( (TX2 - TX1) / 1024 ))
    echo "$IFACE RX: ${RX_RATE}KB/s | TX: ${TX_RATE}KB/s"
}

# Interactive Menu
show_menu() {
    clear
    echo "Interactive System Resource Monitor"
    echo "-----------------------------------"
    echo "[1] Show All Metrics"
    echo "[2] Show Only CPU"
    echo "[3] Show Only Memory"
    echo "[4] Show Only Network"
    echo "[5] Change Refresh Rate (Current: ${REFRESH}s)"
    echo "[6] Exit"
    echo
    read -p "Choose an option: " choice

    case $choice in
        1) MODE="All" ;;
        2) MODE="CPU" ;;
        3) MODE="Memory" ;;
        4) MODE="Network" ;;
        5) read -p "Enter new refresh rate (seconds): " REFRESH ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice"; sleep 1 ;;
    esac
}

# Main loop
while true; do
    clear
    echo "System Monitor - Mode: $MODE | Refresh: ${REFRESH}s"
    echo "Press Ctrl+C to exit or use menu below."

    case $MODE in
        "All")
            CPU=$(get_cpu_usage)
            MEM=$(get_memory_usage)
            draw_bar "$CPU" 100 "CPU"
            draw_bar "$MEM" 100 "Memory"
            echo "$(get_network_usage)"
            ;;
        "CPU")
            CPU=$(get_cpu_usage)
            draw_bar "$CPU" 100 "CPU"
            ;;
        "Memory")
            MEM=$(get_memory_usage)
            draw_bar "$MEM" 100 "Memory"
            ;;
        "Network")
            echo "$(get_network_usage)"
            ;;
    esac

    echo
    echo "[m] Menu | Refreshing in $REFRESH seconds..."
    read -t "$REFRESH" -n 1 input
    if [[ "$input" == "m" ]]; then
        show_menu
    fi
done
