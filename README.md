# OpenRA RA Enhanced（红警增强 Mod）

> **一句话**：面向老玩家的 OpenRA 红警增强 Mod——更好 AI、更清晰体验；开源免费；**不是**商业独立红警。

抖音上不少人在找「画面更好 / 电脑更聪明」的红警体验。我们正在做这件事，并已开源：  
**<https://github.com/Renhuai123/openra-ra-enhanced>**

红色警戒 IP 属于 **EA**，因此我们无法做独立商业红警产品，也**不会**分发游戏本体或版权资源。  
我们能做的是：用 **Mod** 优化体验、加强电脑 AI，并继续探索更强 AI 玩法——**敬请期待**。

完整对外说明：[docs/ANNOUNCEMENT.md](docs/ANNOUNCEMENT.md)

---

> **重要声明**  
> 本仓库是 **Mod / 规则与文档**，**不包含、也不分发** Red Alert 游戏二进制或版权美术资源包。  
> 玩家必须通过 OpenRA 官方 **Content Installer / Asset Import** 自行导入资源。  
> 本项目免费、开源（GPL-3.0），不出售游戏本体。

| | |
|---|---|
| **Mod ID** | `ra-enhanced` |
| **目标引擎** | OpenRA **release-20250330** |
| **许可证** | [GPL-3.0](LICENSE) |
| **平台** | macOS / Windows / Linux（依赖 OpenRA） |

---

## 当前已交付（0.2）

1. **更强 AI（不作弊）**
   - 调优官方 **Normal** 电脑：扩张矿场、电厂冗余、防空、矿车数量、进攻编队
   - 新增遭遇战电脑：**Enhanced Normal** / **Enhanced Hard**
   - 详见 `mod/ra-enhanced/rules/ai-enhanced.yaml`、[docs/ai-goals.md](docs/ai-goals.md)
2. **QoL（不改单位数值）**
   - 强化电力不足 / 资金不足 / 建造放置等反馈链路
   - ChromeMetrics 微调，提升现代显示器可读性
3. **安装脚本**与中文文档、合法性边界说明

---

## 快速开始（macOS）

### 1. 安装 OpenRA

```bash
brew install --cask openra
```

或官网：<https://www.openra.net/download/>  
Homebrew 会安装：`OpenRA - Red Alert.app` 等。

### 2. 导入官方游戏资源（必须）

1. 打开 **OpenRA - Red Alert**
2. 按提示用 **Content Installer** 导入  
   - 原版光盘 / 合法安装目录，或 OpenRA 允许的内容获取方式
3. 先确认原版 RA 能进主菜单，再装本 Mod

本仓库 **不会** 提供 `.mix` / 可执行文件等版权资源。

### 3. 安装本 Mod

```bash
git clone https://github.com/Renhuai123/openra-ra-enhanced.git
cd openra-ra-enhanced
./scripts/install-mod.sh
```

手动（macOS）：

```bash
mkdir -p "$HOME/Library/Application Support/OpenRA/mods"
ln -sfn "$(pwd)/mod/ra-enhanced"   "$HOME/Library/Application Support/OpenRA/mods/ra-enhanced"
```

### 4. 启动 Mod

```bash
# Preferred (works with packaged OpenRA release apps):
"/Applications/OpenRA - Red Alert.app/Contents/MacOS/Launcher" Game.Mod=ra-enhanced

# Or pass the mod directory path explicitly:
"/Applications/OpenRA - Red Alert.app/Contents/MacOS/Launcher" \
  Game.Mod="$PWD/mod/ra-enhanced"
```

> macOS note: the official app only scans `OpenRA - Red Alert.app/Contents/Resources/mods` by default. `./scripts/install-mod.sh` symlinks there. `SupportDir/mods` alone is not enough.

或在 OpenRA Mod 选择界面选 **RA Enhanced**。

遭遇战中选择电脑 **Enhanced Normal** / **Enhanced Hard** 体验增强 AI；原版 Rush/Normal/Turtle/Naval 仍可用。

### 5. 验证

- 窗口标题 / Mod 列表显示 **RA Enhanced**
- 能进单人 / 遭遇战（需已导入资源）
- 无「找不到 mod」类错误

---

## Windows

1. 安装 [OpenRA](https://www.openra.net/download/) 并完成 RA 资源导入  
2. 链接 Mod：

```powershell
$src = (Resolve-Path .\mod\ra-enhanced).Path
$dst = "$env:APPDATA\OpenRA\mods\ra-enhanced"
New-Item -ItemType Junction -Path $dst -Target $src -Force
```

3. 启动：`OpenRA.exe Game.Mod=ra-enhanced` 或启动器选 **RA Enhanced**

---

## Linux

```bash
mkdir -p ~/.config/openra/mods
ln -sfn "$(pwd)/mod/ra-enhanced" ~/.config/openra/mods/ra-enhanced
# 若无效可试 ~/.openra/mods
./scripts/install-mod.sh   # 也可
```

启动：`openra Game.Mod=ra-enhanced`（命令因发行包而异）

---

## 资源与法律边界

| 允许 | 不允许 |
|------|--------|
| 自备合法资源，经 OpenRA Content Installer 导入 | 在本仓库附带 RA 二进制、`.mix` 版权包 |
| 使用 OpenRA 官方允许的内容安装方式 | 二次打包出售游戏本体或资源 |
| 分享本 Mod 的 YAML / 脚本 / 文档（GPL-3.0） | 声称本项目是商业重制版 / EA 官方产品 |

详见：[docs/scope.md](docs/scope.md)、[docs/asset-import.md](docs/asset-import.md)、[NOTICE](NOTICE)。

---

## 仓库结构

```text
openra-ra-enhanced/
├── README.md
├── docs/ANNOUNCEMENT.md      # 对外公告（抖音/社区可转发摘要）
├── ROADMAP.md
├── mod/ra-enhanced/          # Mod 本体
│   ├── mod.yaml
│   ├── rules/ai-enhanced.yaml
│   ├── rules/qol.yaml
│   └── chrome/
└── scripts/install-mod.sh
```

---

## 路线图（摘要）

| 阶段 | 主题 |
|------|------|
| ✅ 骨架 + 文档 + 安装 | 可加载 Mod |
| ✅ AI / QoL v0 | Enhanced 电脑 + 反馈可读性 |
| 下一里程碑 | 固定地图 AI 对打调参、HUD 警告可开关、嵌入式 AI 玩法预研 |
| v0.1 标签 | CHANGELOG + 回归清单 + Release（仅源码） |

详情：[ROADMAP.md](ROADMAP.md)

---

## 许可证

**GNU GPL v3** — 见 [LICENSE](LICENSE)。与 OpenRA 生态一致。

## 致谢

- [OpenRA](https://github.com/OpenRA/OpenRA) 引擎与官方 RA Mod  
- 所有合法导入资源、参与测试与贡献的老玩家们
