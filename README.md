Here's your cleaned up README. Copy and paste this into your `README.md` file:

```markdown
# Linux System Audit Tool
**Version:** 1.0  
**Author:** Aya  
**Course:** OS2 - NSCS 2025/2026

## What is this?
An automated Linux audit tool that collects hardware and software information and generates formatted reports. Designed for cybersecurity professionals to perform system audits, asset inventory, and vulnerability assessment.

## Features
- Hardware audit (CPU, RAM, disk, GPU, network, MAC, USB, motherboard)
- Software audit (OS, kernel, packages, services, processes, open ports)
- Two report types: Short (summary) and Full (detailed)
- Dual format reports: TXT and HTML
- Email delivery of reports
- Cron automation (daily at 4:00 AM)
- Remote monitoring via SSH
- Interactive menu system (bonus)
- Error handling and logging

## Project Structure
```
linux_audit_project/
├── modules/
│   ├── audit.sh            # Main entry point
│   ├── hardware.sh         # Hardware collection
│   ├── software.sh         # Software collection
│   ├── report.sh           # Report generation (TXT/HTML)
│   ├── email.sh            # Email sending
│   ├── remote.sh           # Remote SSH monitoring
│   ├── automation.sh       # Cron job setup
│   └── menu.sh             # Interactive menu (bonus)
├── reports/                # Generated reports
├── logs/                   # Execution logs
├── config.cfg              # Configuration file (not committed to git)
├── config.cfg.template     # Template for configuration
└── README.md
```

## Installation

### 1. Install required packages
```bash
sudo apt update
sudo apt install mailutils openssh-server -y
```

### 2. Make all scripts executable
```bash
chmod +x modules/*.sh
```

### 3. Configure email and settings
```bash
cp config.cfg.template config.cfg
nano config.cfg
```

Set your email address:
```bash
RECIPIENT_EMAIL="your_email@gmail.com"
```

### 4. Setup SSH for remote monitoring (optional)
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

## How to Run

### Quick audit:
```bash
./modules/audit.sh              # Full report with email
./modules/audit.sh --short      # Short report with email
./modules/audit.sh --no-email   # Run without email
```

### Interactive menu:
```bash
./modules/menu.sh
```

### View generated reports:
```bash
ls reports/
cat reports/full_report_example.txt
```

## Reports

Reports are saved to `~/linux_audit_project/reports/` in two formats:

| Format | File naming | Use case |
|--------|-------------|----------|
| TXT | `full_report_example.txt` | Quick viewing, email body |
| HTML | `full_report_example.html` | Browser viewing, formatted |

### What each report contains:

**Short Report:**
- CPU model and cores
- RAM total and available
- Disk usage
- OS version and kernel
- Open ports

**Full Report:** (everything above plus)
- Detailed CPU info
- Network interfaces with MAC/IP
- USB devices
- Motherboard info
- Installed packages list
- Running services
- Top 10 processes
- Logged-in users

## Email Configuration

### Using Gmail (recommended):
1. Enable 2-Factor Authentication on your Gmail
2. Generate an App Password (Google Account → Security → App Passwords)
3. Install msmtp:
```bash
sudo apt install msmtp msmtp-mta
```
4. Create `~/.msmtprc`:
```
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account        gmail
host           smtp.gmail.com
port           587
from           your_email@gmail.com
user           your_email@gmail.com
password       YOUR_APP_PASSWORD

account default : gmail
```
5. Secure the file:
```bash
chmod 600 ~/.msmtprc
```

## Automation (Cron)

The script automatically sets up a cron job. To verify:

```bash
crontab -l
```

You should see:
```
0 4 * * * /home/kitty/linux_audit_project/modules/audit.sh --full
```

To manually edit cron:
```bash
crontab -e
```

## Remote Monitoring

The script supports SSH-based remote monitoring. Configure in `config.cfg`:

```bash
REMOTE_HOST="localhost"           # or remote IP
REMOTE_USER="kitty"               # your username
REMOTE_DIR="/home/kitty/linux_audit_project/remote_reports"
```

With SSH keys configured, no password is required for automation.

## Logging

Execution logs are saved to `logs/audit_YYYYMMDD.log`

To view logs:
```bash
cat logs/audit_$(date '+%Y%m%d').log
```

## Security Considerations

- `config.cfg` contains email credentials - NEVER commit to git
- Use App Passwords instead of real Gmail passwords
- SSH keys are more secure than passwords for automation
- Reports contain system information - handle securely
- All scripts use `set -e` for error handling

## Troubleshooting

### Email not sending?
```bash
# Test mail command
echo "test" | mail -s "Test" your@email.com

# Check mail logs
tail -f /var/log/mail.log
```

### Permission denied?
```bash
chmod +x modules/*.sh
```

### SSH connection failed?
```bash
# Test SSH connection
ssh localhost whoami

# Regenerate SSH keys if needed
ssh-keygen -t rsa -b 4096
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

## Example Output

### Short Report:
```
================================================
     LINUX SYSTEM AUDIT REPORT (SHORT)
================================================
Date     : 20260423_031130
Hostname : kitty-VirtualBox
================================================

CPU: AMD Ryzen 7 PRO 4750U (4 cores)
RAM: 7.8Gi total, 4.4Gi available
DISK: 25G total, 8.6G used (63%)
OS: Ubuntu 24.04.4 LTS
KERNEL: 6.8.0-31-generic
```

## Requirements

- Linux distribution (Ubuntu/Kali/Debian)
- Bash shell
- Standard Linux tools (lscpu, free, df, ip, lspci, lsusb, systemctl)

## Author

**Aya**  
Course: OS2 - National School of Cybersecurity (NSCS)  
Year: 2025/2026

## License

Educational project for OS2 course.
```

Save this to `README.md`. Do you want me to also help you create `config.cfg.template` file?