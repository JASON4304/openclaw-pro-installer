#!/bin/bash
set -e

MODEL_ID="$1"
CONFIG_DIR="$HOME/.openclaw"

echo "📝 [生成配置]"

mkdir -p "$CONFIG_DIR"

cat << JSON > "$CONFIG_DIR/openclaw.json"
{
  "gateway": {
    "port": 18789,
    "auth": {
      "token": "openclaw-$(uuidgen)"
    }
  },
  "models": {
    "providers": {
      "ollama": {
        "models": [
          { "id": "$MODEL_ID" }
        ]
      }
    }
  }
}
JSON

echo "✔ 配置生成完成"
