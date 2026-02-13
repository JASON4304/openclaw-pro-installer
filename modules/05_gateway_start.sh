#!/bin/bash
set -e

echo "🚀 [启动 Gateway]"

openclaw gateway stop 2>/dev/null || true
openclaw gateway start

sleep 1

echo "✔ Gateway 已启动"
