#!/bin/bash
# ===== SOFTWARE AUDIT MODULE =====
# Collects OS and software information from the system

collect_software() {

    echo ">>> Collecting software information..."

    # ---------- OS INFO ----------
    OS_INFO=$(cat /etc/os-release | grep -E "^NAME|^VERSION")

    # ---------- KERNEL ----------
    KERNEL_INFO=$(uname -r)

    # ---------- ARCHITECTURE ----------
    ARCH_INFO=$(uname -m)

    # ---------- INSTALLED PACKAGES ----------
    PACKAGES_INFO=$(dpkg --list | wc -l)
    PACKAGES_LIST=$(dpkg --list | tail -20)   # last 20 packages (not all 1000+)

    # ---------- LOGGED IN USERS ----------
    USERS_INFO=$(who)

    # ---------- RUNNING SERVICES ----------
    SERVICES_INFO=$(systemctl list-units --type=service --state=running | head -20)

    # ---------- ACTIVE PROCESSES ----------
    PROCESSES_INFO=$(ps aux --sort=-%cpu | head -10)   # top 10 by CPU usage

    # ---------- OPEN PORTS ----------
    PORTS_INFO=$(ss -tuln 2>/dev/null || netstat -tuln 2>/dev/null)

    echo ">>> Software collection done!"
}