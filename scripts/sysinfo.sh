#!/usr/bin/env bash
set -euo pipefail

echo "=== System Information ==="
echo "User: $(id -un)"
echo "Effective UID: $(id -u)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -sr)"
echo "Date: $(date --iso-8601=seconds)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h
echo "Docker Daemon:"
if systemctl is-active --quiet docker; then
    echo "active"
else
    echo "inactive"
fi
