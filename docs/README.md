# OpenClaw Pro Installer
一个为 macOS 打造的 **工业级、模块化、可自愈** 的 OpenClaw 安装系统。

## ✨ 特性
- A2 级严格模式（每一步都验证）
- 自动修复（LaunchAgent、端口、配置、模型）
- 自动诊断（健康检查）
- 自动卸载（无残留）
- 自动重装（彻底清理 → 安装 → 启动）
- 模块化设计（可维护、可扩展）
- Debug Mode（调试模式）

## 📦 快速开始
```bash
git clone https://github.com/JASON4304/openclaw-pro-installer
cd openclaw-pro-installer
chmod +x install.sh
./install.sh

echo "⚙️ 正在生成 GitHub Actions..."

# -------------------------
# .github/workflows/release.yml
# -------------------------
cat << 'EOF' > "$PROJECT_DIR/.github/workflows/release.yml"
name: Release

on:
  push:
    tags:
      - "v*.*.*"

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Create ZIP
        run: zip -r openclaw-pro-installer.zip .

      - name: Create TAR.GZ
        run: tar -czf openclaw-pro-installer.tar.gz .

      - name: Upload Release Assets
        uses: softprops/action-gh-release@v2
        with:
          files: |
            openclaw-pro-installer.zip
            openclaw-pro-installer.tar.gz
