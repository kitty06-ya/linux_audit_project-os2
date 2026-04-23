#!/bin/bash

# ==============================================
# audit.sh - Main entry point
# Linux Audit and Monitoring System
# NSCS - OS2 Mini Project 2025/2026
# ==============================================

set -e
trap 'echo "ERROR: Script failed at line $LINENO"' ERR

# ---------- Get project root directory ----------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------- Load config ----------
source "$SCRIPT_DIR/config.cfg"

# ---------- Load modules ----------
source "$SCRIPT_DIR/modules/hardware.sh"
source "$SCRIPT_DIR/modules/software.sh"
source "$SCRIPT_DIR/modules/report.sh"
source "$SCRIPT_DIR/modules/email.sh"
source "$SCRIPT_DIR/modules/remote.sh"
source "$SCRIPT_DIR/modules/automation.sh"

# ---------- Timestamp and hostname ----------
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
HOSTNAME=$(hostname)

# ---------- Run the audit ----------
echo "Starting audit on $HOSTNAME at $TIMESTAMP"

collect_hardware
collect_software
generate_report
send_remote
setup_cron