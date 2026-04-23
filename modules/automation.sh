#!/bin/bash
# ===== AUTOMATION MODULE =====
# Sets up a cron job to run the audit automatically

setup_cron() {

    echo ">>> Setting up cron job..."

    # ---------- Define the cron job ----------
    # This runs the audit every day at 4:00 AM
    CRON_JOB="0 4 * * * bash $HOME/linux_audit_project/audit.sh >> $LOG_DIR/$LOG_FILE 2>&1"

    # ---------- Check if cron job already exists ----------
    if crontab -l 2>/dev/null | grep -q "audit.sh"; then
        echo ">>> Cron job already exists, skipping."
        return 0
    fi

    # ---------- Add the cron job ----------
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

    # ---------- Check if it worked ----------
    if [ $? -eq 0 ]; then
        echo ">>> Cron job set successfully!"
        echo "    Runs daily at 4:00 AM"
    else
        echo ">>> ERROR: Failed to set cron job."
    fi
}
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup_cron
fi