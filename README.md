Linux System Audit Tool

Version: 1.0
Author: Aya
Course: OS2 - NSCS 2025/2026

What is this?

This is an automated Linux audit tool that collects hardware and software information and generates structured reports. It is designed for cybersecurity purposes such as system auditing, asset inventory, and vulnerability analysis.

Features
Hardware audit (CPU, RAM, disk, GPU, network, MAC, USB, motherboard)
Software audit (OS, kernel, packages, services, processes, open ports)
Two report types: Short (summary) and Full (detailed)
Report formats: TXT and HTML
Email delivery of reports
Cron automation (daily at 4:00 AM)
Remote monitoring via SSH
Interactive menu system (bonus feature)
Logging and error handling
Project Structure

linux_audit_project/
├── modules/
│ ├── audit.sh Main entry point
│ ├── hardware.sh Hardware collection
│ ├── software.sh Software collection
│ ├── report.sh Report generation (TXT/HTML)


2025 / 2026
