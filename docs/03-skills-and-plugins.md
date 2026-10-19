# Skills, Plugins, MCP, Prompts

## Definitions

- **Skill**: folder with `SKILL.md` (name + description + workflow steps); optional scripts/references/assets. Use for **repeatable** multi-step workflows.
- **Plugin**: distributable package that can bundle Skills, MCP config, and supporting resources. Validate manifest/schema against current official docs before publishing.
- **MCP**: external tools/resources with their own authentication and authorization. Only enable trusted servers and minimum required access. Never commit tokens. `.mcp.json` is an example and must be verified for the target surface.
- **Prompt**: manually invoked task brief. Promote repeated multi-step prompts to Skills.
- **Scripts**: deterministic executables for validation, install, or config mutation. Preferred over free-form shell in Skills when side effects or verification matter.

## Closed-loop responsibilities

| Concern | Owner |
|---------|--------|
| When to run a workflow | Skill `description` + decision tree |
| How to mutate config / validate | Scripts |
| Task language & acceptance framing | Prompts |
| Integration & truth-checking | Coordinator (see `AGENTS.md`) |
| External tools | MCP (trusted only) |

## Skill authoring rules (optimized)

1. **Negative constraints** in `description`: state when **not** to trigger the skill.
2. **Decision tree first**: inspect status / repo before side effects.
3. **Structured output**: require `WORKER_REPORT` or the project final-report template.
4. **No secret handling in prose**: credentials only via approved secure channels; never echo or write to repo files.
5. **Stop conditions**: destructive, production, publish, deploy → stop unless authorized.

## Prompt → Skill promotion

If a prompt is used more than twice with the same steps, convert it to a Skill under `.agents/skills/<name>/SKILL.md` and keep a thin prompt that only invokes the skill.

## “Plus” note

This template interprets “plus” as **Plugins** (packaging layer), not a subscription plan. If a specific Plus extension is meant, identify it before adapting.
