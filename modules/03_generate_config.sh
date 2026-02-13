#!/bin/bash
set -e
MODEL="$1"
echo "📝 生成配置文件..."
mkdir -p ~/.openclaw
cat << CFG > ~/.openclaw/config.json
{
  "model": "$MODEL",
  "port": 11434
}
CFG
echo "✔ 配置生成完成"
