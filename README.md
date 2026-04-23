Linux System Audit Tool

Version: 1.0
Author: Aya
Course: OS2 - NSCS 2025/2026

Overview

This tool is an automated Linux system audit solution that collects hardware and software information and generates structured reports. It is designed for system auditing, asset tracking, and basic security assessment.

Features
Hardware information (CPU, RAM, disk, network, USB, motherboard)
Software information (OS, kernel, packages, services, processes, open ports)
Short and Full report modes
TXT and HTML report generation
Email report sending
Cron-based automation (daily execution)
SSH-based remote monitoring
Logging system
Interactive menu (optional feature)
Project Structure

The project is organized into modules for each function: audit, hardware, software, reporting, email, automation, remote access, and menu system. It also includes folders for generated reports and logs, plus a configuration file for settings.

Installation Summary
Install required Linux packages (mailutils, openssh-server)
Make scripts executable
Configure email settings in config file
(Optional) Set up SSH keys for remote monitoring
Usage
Run full audit via main script
Optionally choose short report or disable email
Use interactive menu for guided execution
View generated reports in the reports folder
Reports

Two formats are generated:

Short report: basic system overview
Full report: detailed hardware + software analysis

Reports include CPU, memory, disk usage, OS version, network info, running services, installed packages, and active processes.

Automation

The tool can be scheduled using cron to run automatically every day at 4:00 AM.

Security Notes
Configuration file contains sensitive data and must not be shared
SSH keys are recommended over passwords
Email credentials should use app passwords
Reports may contain sensitive system information
Requirements
Linux (Ubuntu, Debian, or Kali)
Bash shell
Standard system utilities (lscpu, free, df, ip, lspci, lsusb, systemctl)
Author

Aya
National School of Cybersecurity (NSCS)
OS2 – 2025/2026
