# 贡献指南

感谢你对 **openra-ra-enhanced** 的兴趣。我们欢迎 AI、UI/QoL、文档与安装体验方面的贡献。

## 开始之前

1. 阅读 [scope.md](scope.md)：确认改动在范围内。
2. 本地安装 OpenRA，完成官方 RA 资源导入。
3. 用 `scripts/install-mod.sh` 装好本 Mod 并能启动。

## 开发约定

- **许可证**：贡献默认以 GPL-3.0 授权。
- **不提交**：游戏二进制、`.mix`、密钥、大型版权资源。
- **OpenRA MiniYaml**：使用 **Tab 缩进**（与上游一致），不要用空格冒充。
- **手感优先**：改数值需在 PR 中说明对经典节奏的影响；优先 AI 行为与 UI。
- **小步 PR**：一个主题一个 PR，便于审查。

## 建议工作流

```bash
git clone https://github.com/Renhuai123/openra-ra-enhanced.git
cd openra-ra-enhanced
git checkout -b feature/your-topic
# 编辑 mod/ra-enhanced/ 或 docs/
./scripts/install-mod.sh
# 启动并自测
```

## PR 检查清单

- [ ] 描述动机与玩家可见效果
- [ ] 说明测试方式（地图、难度、平台）
- [ ] 无版权资源 / 无密钥
- [ ] 若改 AI：对照 [ai-goals.md](ai-goals.md)
- [ ] 若改 UI：说明是否可关闭、是否影响经典观感

## Issue 类型

- `bug`：崩溃、无法加载、明显错误行为
- `enhancement`：AI / QoL 想法
- `docs`：安装与政策文档
- `question`：使用问题（先确认已官方导入资源）

## 行为准则

保持友善、就事论事。禁止分享盗版资源或绕过内容保护的说明。
