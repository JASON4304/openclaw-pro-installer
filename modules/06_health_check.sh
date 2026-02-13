#!/bin/bash
set -e
echo "❤️ 健康检查..."
curl -s http://localhost:11434/health || { echo "❌ 健康检查失败"; exit 1; }
echo "✔ 系统健康"
