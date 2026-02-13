#!/bin/bash
set -e

MODEL_ID="$1"

echo "🧪 [模型检查] $MODEL_ID"

if ollama list | grep -q "$MODEL_ID"; then
  echo "✔ 模型已存在"
else
  echo "⬇️ 正在拉取模型：$MODEL_ID"
  ollama pull "$MODEL_ID"
fi

echo "✔ 模型可用"
