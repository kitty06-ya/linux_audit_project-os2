#!/bin/bash
set -e
trap 'echo "ERROR: Script failed at line $LINENO"' ERR
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# ---------- Load config ----------
source "$PROJECT_ROOT/config.cfg"

TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
HOSTNAME=$(hostname)

# ---------- Load modules (they are in the SAME directory as this script) ----------
source "$SCRIPT_DIR/hardware.sh"
source "$SCRIPT_DIR/software.sh"
source "$SCRIPT_DIR/report.sh"
source "$SCRIPT_DIR/email.sh"
source "$SCRIPT_DIR/remote.sh"
source "$SCRIPT_DIR/automation.sh"

# ---------- Run the audit ----------
echo "Starting audit on $HOSTNAME at $TIMESTAMP"

collect_hardware
collect_software
generate_report
send_remote
setup_cron