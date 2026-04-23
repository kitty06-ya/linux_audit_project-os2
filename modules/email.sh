#!/bin/bash
# ===== EMAIL MODULE =====
# Sends the generated report to the configured email address

send_email() {

    echo ">>> Sending report via email..."

    # ---------- Check if mail command exists ----------
    if ! command -v mail &> /dev/null; then
        echo ">>> ERROR: 'mail' command not found. Install it with: sudo apt install mailutils"
        return 1
    fi

    # ---------- Check if report file exists ----------
    if [ ! -f "$REPORT_TXT" ]; then
        echo ">>> ERROR: Report file not found: $REPORT_TXT"
        return 1
    fi

    # ---------- Send the email ----------
    mail -s "$MAIL_SUBJECT" "$RECIPIENT_EMAIL" < "$REPORT_TXT"

    # ---------- Check if it worked ----------
    if [ $? -eq 0 ]; then
        echo ">>> Email sent successfully to $RECIPIENT_EMAIL"
    else
        echo ">>> ERROR: Email failed to send."
    fi
}