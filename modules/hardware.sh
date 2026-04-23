#!/bin/bash
# ===== HARDWARE AUDIT MODULE =====
# Collects hardware information from the system

collect_hardware() {

    echo ">>> Collecting hardware information..."

    # ---------- CPU ----------
    CPU_INFO=$(lscpu | grep -E "Model name|CPU\(s\)|Architecture")

    # ---------- RAM ----------
    RAM_INFO=$(free -h | grep Mem)

    # ---------- DISK ----------
    DISK_INFO=$(df -h | grep -v tmpfs)

    # ---------- GPU ----------
    GPU_INFO=$(lspci | grep -i vga 2>/dev/null || echo "No GPU detected")

    # ---------- NETWORK INTERFACES ----------
    NET_INFO=$(ip addr | grep -E "^[0-9]+:|inet ")

    # ---------- MAC ADDRESS ----------
    MAC_INFO=$(ip link | grep "link/ether")

    # ---------- USB DEVICES ----------
    USB_INFO=$(lsusb 2>/dev/null || echo "No USB info available")

    # ---------- MOTHERBOARD ----------
    BOARD_INFO=$(hostnamectl 2>/dev/null | grep -E "Hardware|Firmware" || echo "Motherboard info not available")

    echo ">>> Hardware collection done!"
}