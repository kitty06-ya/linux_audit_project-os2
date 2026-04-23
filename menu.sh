#!/bin/bash
# ===== INTERACTIVE MENU =====
# Lets the user choose report type and content before running the audit

# ===== COLORS =====
PINK='\033[38;5;213m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
SOFT_PINK='\033[38;5;218m'
BOLD='\033[1m'
NC='\033[0m'

source "$(dirname "$0")/config.cfg"
source "$(dirname "$0")/modules/hardware.sh"
source "$(dirname "$0")/modules/software.sh"
source "$(dirname "$0")/modules/report.sh"
source "$(dirname "$0")/modules/email.sh"
source "$(dirname "$0")/modules/remote.sh"
source "$(dirname "$0")/modules/automation.sh"

# ---------- Re-declare timestamp (sudo resets it) ----------
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
HOSTNAME=$(hostname)
REPORT_DIR="./reports"

# ===== MENU 1: Choose report content =====
echo ""
echo -e "${PINK}============================================${NC}"
echo -e "${BOLD}       LINUX AUDIT TOOL - MAIN MENU${NC}"
echo -e "${PINK}============================================${NC}"
echo ""
echo -e "${SOFT_PINK}What do you want to audit?${NC}"
echo ""

select AUDIT_CHOICE in "Hardware Only" "Software Only" "Both (Full Audit)" "Exit"; do
    case $AUDIT_CHOICE in

        "Hardware Only")
            echo -e "${PURPLE}>>> Running hardware audit only...${NC}"
            collect_hardware
            break
            ;;

        "Software Only")
            echo -e "${PURPLE}>>> Running software audit only...${NC}"
            collect_software
            break
            ;;

        "Both (Full Audit)")
            echo -e "${PURPLE}>>> Running full audit...${NC}"
            collect_hardware
            collect_software
            break
            ;;

        "Exit")
            echo -e "${SOFT_PINK}Goodbye!${NC}"
            exit 0
            ;;

        *)
            echo -e "${RED}Invalid option, please try again.${NC}"
            ;;
    esac
done

# ===== MENU 2: Choose report type =====
echo ""
echo -e "${PINK}============================================${NC}"
echo -e "${SOFT_PINK}What type of report do you want?${NC}"
echo -e "${PINK}============================================${NC}"
echo ""

select REPORT_CHOICE in "Short Report (Summary)" "Full Report (Detailed)" "Exit"; do
    case $REPORT_CHOICE in

        "Short Report (Summary)")
            REPORT_TYPE="short"
            break
            ;;

        "Full Report (Detailed)")
            REPORT_TYPE="full"
            break
            ;;

        "Exit")
            echo -e "${SOFT_PINK}Goodbye!${NC}"
            exit 0
            ;;

        *)
            echo -e "${RED}Invalid option, please try again.${NC}"
            ;;
    esac
done

# ===== Generate the report =====
generate_report
send_email
send_remote
setup_cron

# ===== Show report in terminal =====
echo ""
echo -e "${PINK}============================================${NC}"
echo -e "${BOLD}           REPORT PREVIEW${NC}"
echo -e "${PINK}============================================${NC}"
cat "$REPORT_TXT"
echo -e "${PINK}============================================${NC}"

# ===== Done =====
echo ""
echo -e "${PINK}============================================${NC}"
echo -e "${PURPLE}${BOLD}         AUDIT COMPLETE!${NC}"
echo -e "${PINK}============================================${NC}"
echo -e "${SOFT_PINK}Report saved to : ${NC}$REPORT_DIR"
echo -e "${SOFT_PINK}Report type     : ${NC}$REPORT_TYPE"
echo -e "${SOFT_PINK}Hostname        : ${NC}$HOSTNAME"
echo -e "${SOFT_PINK}Timestamp       : ${NC}$TIMESTAMP"
echo -e "${PINK}============================================${NC}"