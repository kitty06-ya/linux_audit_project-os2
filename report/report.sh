#!/bin/bash
# ===== REPORT GENERATION MODULE =====
# Generates TXT and HTML system audit reports

generate_report() {

    echo ">>> Generating report..."

    # ---------- SAFE REPORT DIRECTORY (NO PERMISSION ISSUES) ----------
    REPORT_DIR="$HOME/linux_audit_project/reports"
    mkdir -p "$REPORT_DIR"

    # ---------- Define report file paths ----------
    REPORT_TXT="$REPORT_DIR/report_${TIMESTAMP}.txt"
    REPORT_HTML="$REPORT_DIR/report_${TIMESTAMP}.html"

    # ---------- Write TXT report ----------
    cat > "$REPORT_TXT" << EOF
================================================
        LINUX SYSTEM AUDIT REPORT
================================================
Date     : $TIMESTAMP
Hostname : $HOSTNAME
================================================

--- HARDWARE ---

CPU:
$CPU_INFO

RAM:
$RAM_INFO

DISK:
$DISK_INFO

GPU:
$GPU_INFO

NETWORK INTERFACES:
$NET_INFO

MAC ADDRESS:
$MAC_INFO

USB DEVICES:
$USB_INFO

MOTHERBOARD:
$BOARD_INFO

--- SOFTWARE ---

OS INFO:
$OS_INFO

KERNEL: $KERNEL_INFO
ARCHITECTURE: $ARCH_INFO

TOTAL INSTALLED PACKAGES: $PACKAGES_INFO
LAST 20 PACKAGES:
$PACKAGES_LIST

LOGGED IN USERS:
$USERS_INFO

RUNNING SERVICES:
$SERVICES_INFO

TOP 10 PROCESSES:
$PROCESSES_INFO

OPEN PORTS:
$PORTS_INFO

================================================
           END OF REPORT
================================================
EOF

    # ---------- Write HTML report ----------
    cat > "$REPORT_HTML" << EOF
<html>
<head><title>Audit Report - $HOSTNAME</title></head>
<body>
<h1>Linux System Audit Report</h1>
<p><b>Date:</b> $TIMESTAMP</p>
<p><b>Hostname:</b> $HOSTNAME</p>
<hr>
<h2>Hardware</h2>
<pre>CPU: $CPU_INFO</pre>
<pre>RAM: $RAM_INFO</pre>
<pre>DISK: $DISK_INFO</pre>
<pre>GPU: $GPU_INFO</pre>
<pre>NETWORK: $NET_INFO</pre>
<pre>MAC: $MAC_INFO</pre>
<pre>USB: $USB_INFO</pre>
<pre>MOTHERBOARD: $BOARD_INFO</pre>
<hr>
<h2>Software</h2>
<pre>OS: $OS_INFO</pre>
<pre>KERNEL: $KERNEL_INFO</pre>
<pre>ARCH: $ARCH_INFO</pre>
<pre>PACKAGES: $PACKAGES_INFO</pre>
<pre>USERS: $USERS_INFO</pre>
<pre>SERVICES: $SERVICES_INFO</pre>
<pre>PROCESSES: $PROCESSES_INFO</pre>
<pre>PORTS: $PORTS_INFO</pre>
</body>
</html>
EOF

    # ---------- CONFIRM OUTPUT ----------
    echo ">>> Reports saved successfully:"
    echo "TXT  : $REPORT_TXT"
    echo "HTML : $REPORT_HTML"
}

 