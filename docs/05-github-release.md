# GitHub 提交与发布指南

项目已准备好提交到仓库。优先使用已连接的 GitHub 集成；如果权限失败，应先检查应用授权及仓库访问范围。不要将访问令牌写入远程地址。

## 本地 Git 操作流程

```bash
git status --short
git diff --check
git add .
git commit -m "feat: add Codex DeepSeek agent workbench"
git branch -M main
git push -u origin main
```

如果远端仓库已有提交，先拉取并妥善整合历史，禁止直接强制推送覆盖。完成后检查文件是否存在、Actions 工作流状态，以及是否误提交密钥、本地配置或日志。
