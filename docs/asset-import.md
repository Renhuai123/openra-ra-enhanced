# 游戏资源导入（Asset Import）

## 一句话

**本仓库不提供 Red Alert 游戏文件。** 请用 OpenRA 官方流程在你自己的机器上导入资源。

## 为什么

原版《红色警戒》的美术、音频与部分数据仍受版权保护。OpenRA 引擎开源，但**内容**需要玩家合法自备。本 Mod 只发布规则与开源代码。

## 推荐步骤

1. 安装 OpenRA（[官网下载](https://www.openra.net/download/) 或 `brew install --cask openra`）。
2. 启动后选择 **Red Alert**。
3. 按 **Content Installer** 提示操作：
   - 从原版光盘或已安装的游戏目录导入；或
   - 使用 OpenRA 当前版本支持的官方/允许安装方式。
4. 确认原版 RA 可进入单人或遭遇战。
5. 再安装并启动本 Mod（`ra-enhanced`）。

## 本仓库禁止出现的内容

- `*.mix` 游戏包、原版 `.exe` / `.dll` 游戏二进制
- 完整的版权音乐 / 过场视频包
- 指向盗版下载的链接或镜像列表

## 开发者注意

若使用 [OpenRAModSDK](https://github.com/OpenRA/OpenRAModSDK)，内容仍安装到用户 Support 目录；不要把 Content 目录提交进 git。

`.gitignore` 已忽略常见内容路径与二进制模式。
