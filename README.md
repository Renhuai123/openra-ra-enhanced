# OpenRA RA Enhanced（红警增强 Mod）

免费、开源的 [OpenRA](https://www.openra.net/) **Red Alert（红色警戒）增强 Mod**。  
目标：在不破坏经典手感的前提下，提供更好的 AI、现代 UI/显示与 QoL 改进。

> **重要声明**  
> 本仓库是 **Mod / 规则与文档**，**不包含、也不分发** Red Alert 游戏二进制或版权美术资源包。  
> 玩家必须通过 OpenRA 官方流程自行导入游戏资源（Content Installer / Asset Import）。  
> 本项目免费、开源，不出售游戏本体。

| | |
|---|---|
| **本地路径** | `~/Projects/openra-ra-enhanced` |
| **Mod ID** | `ra-enhanced` |
| **许可证** | [GPL-3.0](LICENSE)（与 OpenRA 生态一致） |
| **平台** | macOS / Windows / Linux（依赖 OpenRA） |

---

## 功能方向（进行中）

1. **更好的 AI**：扩张、防守、兵力构成、多线压力（见 [docs/ai-goals.md](docs/ai-goals.md)）
2. **现代 UI / 显示 QoL**：清晰度、快捷信息、可选高 DPI 友好 chrome（保持 RA 味）
3. **不破坏经典玩法**：数值与节奏以原版手感为默认；增强项尽量可开关

详细范围见 [docs/scope.md](docs/scope.md)，四周计划见 [ROADMAP.md](ROADMAP.md)。

---

## 快速开始（macOS）

### 1. 安装 OpenRA

推荐用 Homebrew：

```bash
brew install --cask openra
```

或从官网下载：<https://www.openra.net/download/>

### 2. 导入官方游戏资源（必须）

1. 启动 OpenRA，选择 **Red Alert**
2. 按提示使用 **Content Installer** 导入资源  
   - 可从原版光盘 / 合法安装目录导入  
   - 或按 OpenRA 提示下载/安装允许的内容包
3. 确认能正常进入原版 RA 再继续装本 Mod

本仓库 **不会** 提供 `.mix` / 可执行文件等版权资源。

### 3. 安装本 Mod

克隆后运行安装脚本（会软链接到 OpenRA 用户 Mod 目录）：

```bash
git clone https://github.com/Renhuai123/openra-ra-enhanced.git
cd openra-ra-enhanced
./scripts/install-mod.sh
```

手动安装（macOS）：

```bash
# OpenRA 用户 Mod 目录
mkdir -p "$HOME/Library/Application Support/OpenRA/mods"
ln -sfn "$(pwd)/mod/ra-enhanced" \
  "$HOME/Library/Application Support/OpenRA/mods/ra-enhanced"
```

### 4. 启用 / 启动 Mod

**方式 A — 启动器选 Mod**  
打开 OpenRA，在 Mod 列表中选择 **RA Enhanced**（若已出现）。

**方式 B — 命令行（macOS App）**

```bash
open -a OpenRA --args Game.Mod=ra-enhanced
```

若使用源码/SDK 构建的 `OpenRA`，可参考：

```bash
./OpenRA.app/Contents/MacOS/OpenRA Game.Mod=ra-enhanced
# 或
mono OpenRA.Game.exe Game.Mod=ra-enhanced   # 视你的安装方式而定
```

### 5. 验证

- 启动后窗口标题 / Mod 列表显示 **RA Enhanced**
- 能进入单人 / 遭遇战（资源已导入的前提下）
- 控制台无「找不到 mod」类错误

---

## Windows

1. 安装 [OpenRA](https://www.openra.net/download/)
2. 用启动器完成 **Red Alert** 资源导入
3. 将 `mod/ra-enhanced` 复制或链接到：

   ```text
   %USERPROFILE%\AppData\Roaming\OpenRA\mods\ra-enhanced
   ```

   PowerShell 示例：

   ```powershell
   $src = (Resolve-Path .\mod\ra-enhanced).Path
   $dst = "$env:APPDATA\OpenRA\mods\ra-enhanced"
   New-Item -ItemType Junction -Path $dst -Target $src -Force
   ```

4. 启动 OpenRA，选择 **RA Enhanced**，或：

   ```text
   OpenRA.exe Game.Mod=ra-enhanced
   ```

---

## Linux

1. 安装 OpenRA（发行版包、Flatpak 或官网包）
2. 完成 RA 资源导入
3. 安装 Mod：

   ```bash
   mkdir -p ~/.config/openra/mods   # 部分安装为 ~/.openra/mods，以本机为准
   ln -sfn "$(pwd)/mod/ra-enhanced" ~/.config/openra/mods/ra-enhanced
   # 若无效，试：
   # ln -sfn "$(pwd)/mod/ra-enhanced" ~/.openra/mods/ra-enhanced
   ```

4. 启动：`openra Game.Mod=ra-enhanced`（命令名因包装而异）

也可使用：

```bash
./scripts/install-mod.sh
```

脚本会尝试检测常见用户目录。

---

## 资源导入说明（OpenRA 规则）

| 允许 | 不允许 |
|------|--------|
| 玩家自备原版光盘 / 合法安装，经 OpenRA Content Installer 导入 | 在本仓库或发行物中附带 RA 二进制、`.mix` 版权包 |
| 使用 OpenRA 官方允许的安装方式获取内容 | 二次打包并出售游戏本体或资源 |
| 分享本 Mod 的 YAML / 脚本 / 文档（GPL-3.0） | 声称本项目是商业重制版 |

详情：[docs/scope.md](docs/scope.md)、[docs/asset-import.md](docs/asset-import.md)。

---

## 仓库结构

```text
openra-ra-enhanced/
├── README.md                 # 本文件
├── ROADMAP.md                # 4 周计划
├── LICENSE                   # GPL-3.0
├── docs/                     # 范围、贡献、AI、路线图扩展
├── mod/ra-enhanced/          # OpenRA Mod 本体（可加载骨架）
│   ├── mod.yaml
│   ├── rules/
│   ├── chrome/
│   └── ...
├── scripts/                  # 安装 / 开发辅助
└── .github/                  # Issue 模板等
```

---

## 开发说明

当前为 **可加载骨架 + 文档驱动的增强路线**：

- 继承 / 覆盖 OpenRA 官方 `ra` Mod 行为（见 `mod/ra-enhanced/mod.yaml` 注释）
- AI、UI 的具体改动以 stub + 文档为主，按 [ROADMAP.md](ROADMAP.md) 迭代
- 贡献指南：[docs/contributing.md](docs/contributing.md)

推荐后续接入 [OpenRA Mod SDK](https://github.com/OpenRA/OpenRAModSDK) 以便锁定引擎版本并做完整测试。

---

## 许可证

本项目以 **GNU GPL v3** 授权，见 [LICENSE](LICENSE)。  
与 OpenRA 保持一致，便于上游合并与社区复用。

---

## 致谢

- [OpenRA](https://github.com/OpenRA/OpenRA) 引擎与官方 RA Mod
- 所有遵循开源与合法资源导入方式的玩家与贡献者
