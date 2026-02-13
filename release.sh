#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "❌ 请输入版本号，例如： ./release.sh v1.0.0"
  exit 1
fi

VERSION="$1"

echo "📦 打包项目..."

zip -r "openclaw-pro-installer-$VERSION.zip" . >/dev/null
tar -czf "openclaw-pro-installer-$VERSION.tar.gz" . >/dev/null

echo "✔ 打包完成"

echo "🏷️ 创建 Git 标签：$VERSION"
git tag "$VERSION"
git push origin "$VERSION"

echo "🎉 已推送标签，GitHub Actions 将自动创建 Release"
