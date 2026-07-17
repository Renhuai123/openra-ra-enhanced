# 公告：红警增强 Mod 开源了

抖音上很多老玩家在找：**红色警戒画面更好看一点、电脑 AI 更聪明一点**。  
我们正在做的，就是这件事——一个基于 [OpenRA](https://www.openra.net/) 的 **Red Alert 增强 Mod**，并已在 GitHub 开源：

**仓库**：<https://github.com/Renhuai123/openra-ra-enhanced>

## 能做什么 / 不能做什么（请先看清）

红色警戒的知识产权属于 **EA**。  
因此我们**不能**、也**不会**去做一个「独立商业红警产品」去卖游戏本体或分发版权资源。

我们**可以**做的是：

- 以 **OpenRA Mod** 的方式，优化老玩家熟悉的红警体验
- 加强 **电脑 AI**（扩张、防守、兵种构成、持续压力）
- 后续继续探索 **更强的 AI 对手** 与嵌入式 AI 玩法增强——**敬请期待**

本仓库只包含 Mod 规则、脚本与文档，**不包含**游戏二进制或 `.mix` 等版权资源。  
游玩前请自行安装 OpenRA，并通过官方 **Content Installer** 合法导入红警资源。

## 现在已经有什么

| 模块 | 状态 |
|------|------|
| 可加载 Mod 骨架 `ra-enhanced` | ✅ |
| AI：强化默认 Normal + 新增 Enhanced Normal / Hard | ✅（持续调参） |
| QoL：关键建造/电力/资金反馈与可读性微调 | ✅（不改单位数值） |
| macOS / Windows / Linux 安装说明 | ✅ |

## 怎么玩（最短路径）

1. 安装 OpenRA（macOS 可用 `brew install --cask openra`）
2. 启动后用 Content Installer 导入 Red Alert 资源
3. 安装本 Mod：`./scripts/install-mod.sh`
4. 启动：`open -a "OpenRA - Red Alert" --args Game.Mod=ra-enhanced`（或在 Mod 列表选择 **RA Enhanced**）
5. 遭遇战里可选择 **Enhanced Normal / Enhanced Hard** 电脑

详细步骤见根目录 [README.md](../README.md)。

## 写给老玩家

我们不是要取代你记忆里的红警，而是希望在合法、开源的前提下，让「再开一局」更舒服：电脑不那么摆烂，界面更清楚，经典手感还在。

欢迎 Star、提 Issue、一起改 AI——**敬请期待**后续更强的 AI 与体验更新。
