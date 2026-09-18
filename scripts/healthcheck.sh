#!/usr/bin/env bash
set -euo pipefail

TARGET_URL="${1:-http://localhost:8080}"

echo "Checking ${TARGET_URL}..."

if ! HTTP_STATUS="$(curl -sS -o /dev/null -w '%{http_code}' "${TARGET_URL}")"; then
    echo "Health check failed: unable to connect to ${TARGET_URL}" >&2
    exit 1
fi

if [[ "${HTTP_STATUS}" == "200" ]]; then
    echo "Health check passed: HTTP ${HTTP_STATUS}"
    exit 0
fi

echo "Health check failed: expected HTTP 200, got HTTP ${HTTP_STATUS}" >&2
exit 1
