# Skills, Plugins, MCP, Prompts

- **Skill**: folder with `SKILL.md`, metadata and workflow steps; optional scripts/references/assets. Use for repeatable workflows.
- **Plugin**: distributable package that can bundle Skills, MCP config, and supporting resources. Validate manifest/schema against current official docs before publishing.
- **MCP**: external tools/resources with their own authentication and authorization. Only enable trusted servers and minimum required access. Never commit tokens. `.mcp.json` is an example and must be verified for the target surface.
- **Prompt**: manually invoked task brief. Promote repeated multi-step prompts to Skills. Pair Skills with MCP only when live external systems are needed.
- **“Plus”**: this template interprets it as Plugins. A ChatGPT subscription plan is not a project config artifact. If you meant a specific Plus extension, identify it before adapting.
