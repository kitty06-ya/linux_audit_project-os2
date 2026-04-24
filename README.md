
# 🛡️ Linux System Audit & Monitoring Tool

![Version](https://img.shields.io/badge/version-1.0-blue) ![Shell](https://img.shields.io/badge/shell-bash-green) ![License](https://img.shields.io/badge/course-NSCS%20OS2-red)

> An automated Linux audit and monitoring system built with Bash shell scripting, developed as part of the Operating System 2 course at the National School of Cybersecurity (NSCS).

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Reports](#reports)
- [Automation](#automation)
- [Remote Monitoring](#remote-monitoring)
- [Security Notes](#security-notes)
- [Author](#author)

---

## 📌 Overview

This tool is a fully automated Linux system audit solution designed for system administrators and cybersecurity students. It collects detailed hardware and software information, generates structured reports in multiple formats, sends them via email, and supports SSH-based remote monitoring — all scheduled automatically using cron jobs.

---

## ✨ Features

- 🖥️ **Hardware Audit** — CPU, RAM, Disk, GPU, Network interfaces, USB devices, Motherboard
- 📦 **Software Audit** — OS info, Kernel, installed packages, running services, open ports, active processes
- 📄 **Report Generation** — Short (summary) and Full (detailed) reports in TXT and HTML formats
- 📧 **Email Sending** — Automatically sends reports to a configured email address
- ⏰ **Cron Automation** — Scheduled daily execution at 4:00 AM
- 🌐 **Remote Monitoring** — SSH-based report sending to a remote server
- 🎨 **Colorized Output** — Color-coded terminal feedback
- 📋 **Interactive Menu** — User-friendly menu interface

---

## 📁 Project Structure

```
linux_audit_project/
├── modules/
│   ├── hardware.sh       # Hardware information collection
│   ├── software.sh       # Software and OS information collection
│   ├── report.sh         # Report generation (TXT & HTML)
│   ├── email.sh          # Email sending functionality
│   ├── remote.sh         # SSH remote monitoring
│   ├── automation.sh     # Cron job setup
│   └── menu.sh           # Interactive menu
├── reports/              # Generated audit reports
├── remote_reports/       # Reports received from remote machines
├── audit.sh              # Main entry point
├── config.cfg            # Configuration file
├── .gitignore
└── README.md
```

---

## ⚙️ Requirements

- Linux (Ubuntu, Debian, or Kali Linux)
- Bash shell
- The following standard tools must be available:

```
lscpu, free, df, ip, lspci, lsusb, systemctl, ss, dpkg, uname
```

- Optional tools for extra features:

```
mailutils or msmtp (for email)
openssh-server (for remote monitoring)
```

---

## 🔧 Installation

**Step 1 — Clone the repository**

```
git clone https://github.com/kitty06-ya/linux_audit_project-os2.git
cd linux_audit_project-os2
```

**Step 2 — Install required packages**

```
sudo apt update
sudo apt install mailutils openssh-server -y
```

**Step 3 — Make all scripts executable**

```
chmod +x audit.sh
chmod +x modules/*.sh
```

**Step 4 — Create the reports directory if it doesn't exist**

```
mkdir -p reports
mkdir -p remote_reports
```

---

## 🔩 Configuration

Open `config.cfg` and set your preferences:

```
nano config.cfg
```

Key settings to configure:

```
REPORT_TYPE="full"           # Options: short or full
EMAIL_TO="your@email.com"    # Recipient email address
REMOTE_USER="username"       # Remote server username
REMOTE_HOST="192.168.x.x"   # Remote server IP address
REMOTE_DIR="/path/to/dir"    # Remote directory to store reports
```

> ⚠️ Never share your `config.cfg` file — it contains sensitive credentials.

---

## 🚀 Usage

**Run the full audit:**

```
bash audit.sh
```

**Run with short report:**

```
bash audit.sh --short
```

**Run without sending email:**

```
bash audit.sh --no-email
```

**Launch the interactive menu:**

```
bash modules/menu.sh
```

---

## 📊 Reports

Two types of reports are generated automatically inside the `reports/` folder:

| Type | Description | Formats |
|------|-------------|---------|
| Short Report | Quick system summary — hostname, CPU, RAM, disk, OS | TXT, HTML |
| Full Report | Complete audit — all hardware, software, services, ports, processes | TXT, HTML |

Reports are named with a timestamp, for example:

```
reports/report_20260423_035537.txt
reports/report_20260423_035537.html
```

---

## ⏰ Automation

The tool sets up a cron job automatically to run the audit every day at **4:00 AM**.

To verify the cron job is active, run:

```
crontab -l
```

You should see something like:

```
0 4 * * * /home/youruser/linux_audit_project/audit.sh >> /home/youruser/linux_audit_project/logs/cron.log 2>&1
```

To manually edit cron jobs:

```
crontab -e
```

---

## 🌐 Remote Monitoring

The tool supports sending reports to a remote server via SSH/SCP.

**Step 1 — Generate SSH keys (recommended over passwords):**

```
ssh-keygen -t rsa -b 4096
```

**Step 2 — Copy your key to the remote server:**

```
ssh-copy-id username@remote-server-ip
```

**Step 3 — Configure remote settings in `config.cfg`:**

```
REMOTE_USER="username"
REMOTE_HOST="192.168.x.x"
REMOTE_DIR="/home/username/reports"
```

Reports will be sent automatically every time the audit runs.

---

## 🔒 Security Notes

- `config.cfg` contains sensitive data — **never push it to a public repository**
- Use **SSH keys** instead of passwords for remote access
- Use **app passwords** for email (not your main account password)
- Generated reports contain sensitive system information — store them securely
- This project is for educational purposes in a controlled environment

---

## 👩‍💻 Author

**Aya**
National School of Cybersecurity (NSCS)
OS2 – Academic Year 2025/2026
Teacher: Dr. BENTRAD Sassi

---



