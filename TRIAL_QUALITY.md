# 无限试用会员画质（trial-quality 分支说明）

本分支在 PiliPlus 上游基础上增加了「无限试用会员画质」功能，
移植自 [BiliRoamingX](https://github.com/BiliRoamingX/BiliRoamingX) 的 `trial_vip_quality` 实现。

## 功能说明

- 设置入口：**设置 → 视频与弹幕设置 → 无限试用会员画质**（默认关闭）
- 开启后，请求播放地址时改走 B 站 APP 端统一播放接口
  （gRPC `bilibili.app.playerunite.v1.Player/PlayViewUnite`），
  并在请求中携带 `is_need_trial = true`，向官方申请**会员画质试看流**
  （1080P 高码率 / 4K / 杜比 / HDR 等大会员画质的官方试看通道）。
- 解析响应时不读取 `qn_trial_info` 与 `stream_info.need_vip`，
  等效于 BiliRoamingX 的 `clearQnTrialInfo()` + `needVip=false`——
  即客户端不执行试看时长限制、画质菜单不显示大会员锁。
- 请求失败或服务器未下发试看流时，自动回退到 PiliPlus 原有 REST 取流逻辑，不影响正常播放。

## 重要边界（务必了解）

能否拿到试看流由 **B 站官方服务器**决定，客户端只能决定"要不要试看"和"执不执行限制"。
这与 BiliRoamingX 的行为一致（其设置描述：只解决试用次数问题，能否试用取决于官方接口）。
如果 B 站服务端收紧试看策略，本功能会自动表现为"回退到普通画质"，不会导致播放失败。
使用本功能属于违反 B 站用户协议的用法，存在账号风控风险，建议使用小号。

## 改动清单（相对上游，保持最小侵入）

新增文件（升级零冲突）：

- `lib/grpc/bilibili/app/playerunite/` — playerunite v1 proto 的 Dart 编译产物
  （由官方 protoc + protoc_plugin 25.1.0 生成，复用项目已有 playershared.pb.dart）
- `lib/grpc/player_unite.dart` — PlayViewUnite 封装：构造请求（is_need_trial=true）+
  响应转换为现有 `PlayUrlModel`（忽略试看标记）

修改文件（每处仅数行）：

- `lib/http/video.dart` — `videoUrl` 开头加开关分支，优先走试看流，失败回退 REST
- `lib/utils/storage_key.dart` / `lib/utils/storage_pref.dart` — `trialVipQuality` 设置项
- `lib/pages/setting/models/video_settings.dart` — 设置界面开关

## 如何构建 APK

上游构建依赖对 Flutter SDK 打补丁（见 `.github/workflows/build.yml` 的 Apply Patch 步骤），
因此**本机直接 `flutter build` 会失败**（会报上游文件引用 Flutter 内部 API 的错误），
请使用 GitHub Actions 云端构建（fork 仓库 `sherlockmoretti/PiliPlus` 已配置好）：

```bash
gh workflow run build.yml --repo sherlockmoretti/PiliPlus --ref trial-quality -f build_android=true
```

构建完成后到 https://github.com/sherlockmoretti/PiliPlus/actions 的对应 run 页面
下载 Artifacts 中的 APK 安装。

## 如何跟随上游升级

上游 PiliPlus 更新后，执行：

```bash
./sync_upstream.sh
```

脚本会自动：同步上游 → rebase 本功能分支 → 推送 → 触发云端构建（带时间戳 tag，
构建完成后在 [Releases](https://github.com/sherlockmoretti/PiliPlus/releases) 页面
直接下载完整可安装的 APK）。
rebase 冲突时脚本会停下提示，解决后继续即可。

> 注意：Actions 的 Artifacts 里下载到的 Android 产物是"散装"的（上游 workflow 用
> `upload-artifact@v7 archive:false` 上传，会把 APK 内容解开），请从 Release 下载 APK。

## 实现原理学习资料

逆向分析报告（含 BiliRoamingX 原始实现的三层 hook 与版本考证）：
`../apk_analysis/BiliRoamingX_试看高画质分析报告.md`
