#!/bin/bash
# ===== REMOTE MONITORING MODULE =====
# Sends the generated report to a remote server via SSH

send_remote() {

    echo ">>> Sending report to remote server..."

    # ---------- Check if scp command exists ----------
    if ! command -v scp &> /dev/null; then
        echo ">>> ERROR: 'scp' not found. Install with: sudo apt install openssh-client"
        return 1
    fi

    # ---------- Check if report file exists ----------
    if [ ! -f "$REPORT_TXT" ]; then
        echo ">>> ERROR: Report file not found: $REPORT_TXT"
        return 1
    fi

    # ---------- Send report to remote server ----------
    scp -i "$SSH_KEY_PATH" \
        -o ConnectTimeout=5 \
        -P "$SSH_PORT" \
        "$REPORT_TXT" \
        "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

    # ---------- Check if it worked ----------
    if [ $? -eq 0 ]; then
        echo ">>> Report sent successfully to $REMOTE_HOST"
    else
        echo ">>> ERROR: Failed to send report to remote server."
    fi
}