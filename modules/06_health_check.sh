#!/bin/bash
set -e

echo "❤️ [健康检查]"

curl -s http://127.0.0.1:18789/health | grep -q '"status":"ok"' \
  && echo "✔ Gateway 健康" \
  || { echo "❌ Gateway 不健康"; exit 1; }
