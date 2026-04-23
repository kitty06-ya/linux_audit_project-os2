#!/bin/bash
# ===== MAIN AUDIT SCRIPT =====
# This is the entry point of the audit tool.
# It loads the config and runs all modules.

# ---------- Load config ----------
source "$(dirname "$0")/config.cfg"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
HOSTNAME=$(hostname)
# ---------- Load modules ----------
source "$(dirname "$0")/modules/hardware.sh"
source "$(dirname "$0")/modules/software.sh"
source "$(dirname "$0")/modules/report.sh"
source "$(dirname "$0")/modules/email.sh"
source "$(dirname "$0")/modules/remote.sh"
source "$(dirname "$0")/modules/automation.sh"

# ---------- Run the audit ----------
echo "Starting audit on $HOSTNAME at $TIMESTAMP"

collect_hardware
collect_software
generate_report
send_email
send_remote
setup_cron