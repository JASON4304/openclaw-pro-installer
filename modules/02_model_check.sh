#!/bin/bash
set -e
MODEL="$1"
echo "🧪 检查模型：$MODEL"
ollama list | grep -q "$MODEL" || ollama pull "$MODEL"
echo "✔ 模型可用"
