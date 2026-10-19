# GitHub Release

The project is prepared for the repository. Use the connected GitHub integration when available; if permissions fail, check repository/app authorization before retrying. Do not embed tokens in remote URLs.

For local Git workflow:
```bash
git status --short
git diff --check
git add .
git commit -m "feat: add Codex DeepSeek agent workbench"
git branch -M main
git push -u origin main
```

If the remote is initialized, fetch/reconcile history rather than force-push. Verify files and Actions status, and ensure no secrets/config/logs were committed.
