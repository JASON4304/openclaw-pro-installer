#!/bin/bash
set -e

echo "🧹 [清理旧状态]"

rm -rf "$HOME/.openclaw/tmp" 2>/dev/null || true
mkdir -p "$HOME/.openclaw/tmp"

echo "✔ 清理完成"
