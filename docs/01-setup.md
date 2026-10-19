# Codex + DeepSeek Setup

1. Update Codex CLI/Desktop and check current official docs. Confirm the config schema supported by your installed version before changing provider settings.
2. Back up `~/.codex/config.toml` before editing. The example TOML is illustrative, not guaranteed drop-in configuration; Provider schema/wire protocol varies by Codex version.
3. Your previous setup used provider `deepseek`, model `deepseek-flash`, reasoning effort `high`. Retain these only if the current Codex build and endpoint support them.
4. Merge valid keys manually; never put an API key in tracked files. Prefer environment/local credential storage supported by your setup.
5. Verify with a read-only prompt, then test file reading, a safe edit, and local tests separately. Change one variable at a time.
6. User-level `~/.codex/config.toml` is for provider/model/machine settings. Project `AGENTS.md` defines rules; `.codex/agents/` defines roles; `.agents/skills/` defines workflows. Check official docs for keys that cannot be set project-locally.
7. Trust only inspected repositories. Require approval for destructive commands, production writes, publishing, and deployment. Do not disable sandbox/approvals to work around integration errors.

Smoke test: ask Codex to read `AGENTS.md`, summarize agent/skill structure, and identify `bash scripts/validate.sh`; request no file changes.
