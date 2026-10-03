#!/bin/bash
# 一键同步上游 PiliPlus 更新并重新构建「无限试用会员画质」分支
#
# 用法：./sync_upstream.sh
# 流程：
#   1. 拉取上游最新代码
#   2. main 分支快进到上游最新（保持与上游完全一致）
#   3. trial-quality 分支 rebase 到新 main（把画质功能提交挪到最新代码之上）
#   4. 推送到你的 fork 并触发 GitHub Actions 云端打包 APK
#
# 冲突处理：rebase 冲突时脚本会停下来，解决冲突后执行
#   git rebase --continue && git push --force-with-lease origin trial-quality
#   再手动触发构建（脚本退出信息里有命令）

set -euo pipefail

FORK="sherlockmoretti/PiliPlus"
BRANCH="trial-quality"

echo "==> 1/5 拉取上游..."
git fetch upstream

echo "==> 2/5 快进 main 到上游最新..."
git checkout main
git merge --ff-only upstream/main

echo "==> 3/5 rebase ${BRANCH} 到新 main..."
git checkout "$BRANCH"
if ! git rebase main; then
  echo ""
  echo "!! rebase 冲突：请手动解决冲突后执行 git rebase --continue"
  echo "   完成后推送：git push --force-with-lease origin ${BRANCH} main"
  echo "   再触发构建：gh workflow run build.yml --repo ${FORK} --ref ${BRANCH} -f build_android=true"
  exit 1
fi

echo "==> 4/5 推送到 fork..."
git push origin main
git push --force-with-lease origin "$BRANCH"

echo "==> 5/5 触发 GitHub Actions 构建 Android APK..."
gh workflow run build.yml --repo "$FORK" --ref "$BRANCH" -f build_android=true

echo ""
echo "完成。构建进度：https://github.com/${FORK}/actions"
echo "APK 产物在 Actions 构建页的 Artifacts 里下载。"
