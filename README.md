# Linux System Audit Tool
**Version:** 1.0  
**Author:** aya 
**Course:** OS2 - NSCS 2025/2026

## What is this?
An automated Linux audit tool that collects hardware and software information and generates formatted reports.

## Project Structure
linux_audit_project/
├── audit.sh            # Main entry point
├── config.cfg          # Configuration file
├── modules/
│   ├── hardware.sh     # Hardware audit
│   ├── software.sh     # Software audit
│   ├── report.sh       # Report generation
│   ├── email.sh        # Email sending
│   ├── remote.sh       # Remote monitoring
│   └── automation.sh   # Cron automation
├── reports/            # Generated reports
└── README.md
## Installation
```bash
# 1. Install required tools
sudo apt update
sudo apt install mailutils openssh-client net-tools -y

# 2. Make the script executable
chmod +x audit.sh modules/*.sh

# 3. Edit configuration
nano config.cfg
```

## How to Run
```bash
# Run the full audit
sudo bash audit.sh
```

## Configuration
Edit `config.cfg` to set:
- Your email address
- Report directory
- Remote server details

## Reports
Reports are saved to `/var/log/sys_audit/` in both `.txt` and `.html` formats.

## Automation
A cron job is automatically set up to run the audit daily at 4:00 AM.