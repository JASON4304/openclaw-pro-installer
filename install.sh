#!/bin/bash
set -e

DEBUG=0
if [[ "$1" == "--debug" ]]; then
  DEBUG=1
  set -x
fi

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR"

MODULES=(
  modules/00_env_check.sh
  modules/01_cleanup.sh
  modules/02_model_check.sh
  modules/03_generate_config.sh
  modules/04_gateway_install.sh
  modules/05_gateway_start.sh
  modules/06_health_check.sh
)

echo "🔐 设置模块执行权限..."
for f in "${MODULES[@]}"; do chmod +x "$f"; done

echo "🔍 环境检查..."
modules/00_env_check.sh

echo "🧹 清理旧状态..."
modules/01_cleanup.sh

echo "🧪 模型检查..."
DEFAULT_MODEL="gpt-oss:20b"
modules/02_model_check.sh "$DEFAULT_MODEL"

echo "📝 生成配置..."
modules/03_generate_config.sh "$DEFAULT_MODEL

########################################
# 生成模块脚本 modules/*.sh
########################################

# 00_env_check.sh
cat << 'EOF' > "$PROJECT_DIR/modules/00_env_check.sh"
#!/bin/bash
set -e
echo "🔍 [环境检查]"
command -v ollama >/dev/null 2>&1 || { echo "❌ 未检测到 Ollama"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ 未检测到 Node.js"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "❌ 未检测到 npm"; exit 1; }
echo "✔ 环境正常"
