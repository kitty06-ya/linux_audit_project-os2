#!/bin/bash
# ===== REPORT GENERATION MODULE =====
# Takes collected data and writes it into formatted report files

generate_report() {

    echo ">>> Generating report..."

    mkdir -p "$REPORT_DIR"

    REPORT_TXT="$REPORT_DIR/report_${TIMESTAMP}.txt"
    REPORT_HTML="$REPORT_DIR/report_${TIMESTAMP}.html"

    # ---------- SHORT REPORT ----------
    if [ "$REPORT_TYPE" = "short" ]; then
        cat > "$REPORT_TXT" << EOF
================================================
     LINUX SYSTEM AUDIT REPORT (SHORT)
================================================
Date     : $TIMESTAMP
Hostname : $HOSTNAME
================================================

CPU:
$CPU_INFO

RAM:
$RAM_INFO

DISK:
$DISK_INFO

OS INFO:
$OS_INFO

KERNEL: $KERNEL_INFO

OPEN PORTS:
$PORTS_INFO

================================================
           END OF SHORT REPORT
================================================
EOF

    # ---------- FULL REPORT ----------
    else
        cat > "$REPORT_TXT" << EOF
================================================
        LINUX SYSTEM AUDIT REPORT (FULL)
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
           END OF FULL REPORT
================================================
EOF
    fi

    # ---------- HTML report ----------
    cat > "$REPORT_HTML" << EOF
<html>
<head><title>Audit Report - $HOSTNAME</title></head>
<body>
<h1>Linux System Audit Report ($REPORT_TYPE)</h1>
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

    echo ">>> Reports saved to $REPORT_DIR"
    echo "    TXT  : $REPORT_TXT"
    echo "    HTML : $REPORT_HTML"
    send_email "$REPORT_TXT"
}
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    generate_report
fi