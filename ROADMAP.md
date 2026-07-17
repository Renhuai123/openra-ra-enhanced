# ROADMAP — 4 周计划

本路线图对应「更好 AI + 现代 UI/QoL + 保持经典手感」的首个可玩迭代。  
不包含游戏二进制分发；资源始终由玩家经 OpenRA 官方导入。

---

## Week 1 — 骨架可加载 & 基线

**目标**：Mod 能在 Mac / Win / Linux 选中并启动；文档齐全。

| 任务 | 状态 |
|------|------|
| 仓库骨架、`mod.yaml`、安装脚本 | ✅ 本交付 |
| README（安装 / 导入资源 / 启用） | ✅ |
| `docs/scope`、贡献、AI 目标 | ✅ |
| 验证：官方 RA 资源导入后能进本 Mod | 🔲 本机 Content Installer（需用户点击） |
| 锁定目标 OpenRA 发行版（release 号记入 README） | ✅ release-20250330 |

**验收**：`Game.Mod=ra-enhanced` 可进入主菜单；无版权资源进仓库。

---

## Week 2 — AI 基线增强（不改经典节奏）

**目标**：在默认遭遇战中 AI 更「会玩」，但单位数值尽量不动。

| 任务 | 说明 | 状态 |
|------|------|------|
| 梳理官方 `ra` AI YAML 钩子 | `docs/ai-goals.md`、`ai-notes.yaml` | ✅ |
| 实现 v0：更好的扩张 / 电厂 / 防守优先级 | `ai-enhanced.yaml` 覆盖 Normal | ✅ |
| 命名 AI 档位 | `enhanced-normal` / `enhanced-hard` | ✅ |
| 简单测试清单（文档化） | 固定地图对打记录 | 🔲 下一里程碑 |

**验收**：同图同难度下，增强 AI 比默认更少「摆烂」，不出现明显作弊经济。

---

## Week 3 — UI / 显示 QoL

**目标**：现代可读性，仍像 RA。

| 任务 | 说明 |
|------|------|
| Chrome / 菜单可读性（字号、对比度） | `chrome/` stubs → 实装 |
| 可选：战斗中关键信息（电力、资金警告） | 默认温和，可关 |
| 高 DPI / Retina（macOS）说明与测试 | 文档 + 必要时缩放相关 chrome |
| 不引入「网游大厅风」大改版 | 见 scope |

**验收**：主菜单与局内 HUD 在 1080p / Retina 上可读；默认皮肤仍有 RA 辨识度。

---

## Week 4 — 打磨、开关、发布准备

**目标**：可分享的 v0.1 标签。

| 任务 | 说明 |
|------|------|
| 功能开关（AI 档 / QoL 项）文档化 | 玩家可退回接近原版手感 |
| 回归：经典单位节奏抽测 | 坦克战、海空、工程师偷家 |
| CHANGELOG + 已知问题 | 发 GitHub Release（仅源码/Mod） |
| 贡献流程跑通（Issue / PR） | `docs/contributing.md` |

**验收**：打 `v0.1.0` tag；Release 附件不含任何游戏资源包。

---

## 之后（Backlog）

- 接入 OpenRAModSDK，CI 校验 YAML
- 更深的 AI（多线佯攻、海军时机）— 可能需 C# bot 模块
- 观战 / 录像 QoL
- 可选平衡补丁分支（与「经典手感」主线分离）

---

## 明确不做（本阶段）

- 商业重制或收费
- 分发 Red Alert 二进制 / `.mix` 资源
- 大幅改变单位数值导致「不像红警」
