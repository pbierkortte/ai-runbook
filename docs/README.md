# AI Runbook

A dotfiles repo that treats AI agent behavior as infrastructure.

> [!IMPORTANT]
> The contents of this repository, including skills, prompts, rules, documentation, code, and generated outputs, are likely AI-generated or AI-assisted (this note included 😄).

## Purpose

- Share AI that's too good to keep to myself.
- Update docs automatically so I don't have to.
- Make it easier to install and reuse skills.
- Show people how to actually use these things.
- Treat agent behavior like infrastructure.
- Keep it versioned, diffable, and deployable.
- Let naming conventions and file placement do the work of configuration.
- Treat the workspace as disposable.
- Use the repo as the only persistence.

## Usage

### Dotfiles Setup

Fork this repo and select it as your [dotfiles repository](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles) in Codespaces settings. Set `ENABLE_DOTFILES=1` as a Codespace secret to activate bootstrap (see [Dotfiles Opt-In](dotfiles-optin.md)). Add any other environment variables as Codespace secrets. Every new codespace runs `script/bootstrap` automatically.

Run the bootstrap script to install tools, configure agents, and wire up skill directories.

```sh
bash script/bootstrap
```

Bootstrap also sets AI-friendly defaults like `GIT_PAGER=cat` and `NPM_CONFIG_LOGLEVEL=warn` to suppress pagers and noisy output so agents can parse tool results cleanly.

### CORES

An identity-engineering framework built around a meta mnemonic.

It keeps the persona model coherent, consistent, explainable, and easy to extend.

Fill the 5 slots (C/O/R/E/S):
- Context: Who this is
- Obstacle: Why this matters
- Routine: How this works
- Effect: What this did
- Scope: Which this retains

The result is a reusable structure for defining and evolving personality modules. 

Curiously, this aligns with the “personality spheres” concept from a certain puzzle game.

### Environment Variables

Set these to install and configure AI agents automatically.

`OPENROUTER_API_KEY`: Installs Cline globally and runs auth with the `openrouter/auto` model.

`ANTHROPIC_API_KEY`: Installs Claude Code globally. Pay-as-you-go via the Anthropic Console.

`CLAUDE_CODE_OAUTH_REFRESH_TOKEN` + `CLAUDE_CODE_OAUTH_SCOPES` **Experimental**: Installs Claude Code globally for subscription users. See [Claude Code Authentication for GitHub Codespaces](claude-code-codespaces-auth.md) for setup.

In GitHub Codespaces, `GITHUB_REPOSITORY` is detected automatically to set the skills manifest path.

### Skills

#### Naming

_Generally_ skills follow the format: `{subject…}-{predicate…}`.

#### Install

```shell
npx openskills install pbierkortte/ai-runbook
```

#### Update

```shell
npx openskills update
```

#### Invoke

Slash command:

```shell
/conventional-commit
```

Or just ask naturally:

```shell
do a conventional commit
```

#### List

```shell
/skills
```

### Tools

Each tool file contains a specific prompt with instructions.

### Adaptive Indexing

Runs on markdown and one bash script. Let docs tell agents what exists so you never hand-write instructions again.

#### AGENTS.md Files

An `AGENTS.md` at the repo root activates agent features in supported IDEs. It doubles as a table of contents agents read on first contact. It writes itself.

#### Surfacing Rules

Rules live in `RULE.md` files scoped to the directory they apply to. Write them as headings and they surface into the index automatically. `rules/house/RULE.md` follows its own rules and serves as the example.

One rule per line keeps each statement atomic so agents can follow it.

#### Hydrate and Dehydrate Scripts
 
Scans markdown headings and regenerates every `AGENTS.md` it finds. Add an empty `AGENTS.md` to a directory and the docs there get noticed.
 
Before hydrating, it runs `script/stage-rules`, which automatically collects rules from both the local `rules/` directory (staged as `{NAME}_RULES.md`) and any relative `../dotfiles/rules/` directory (staged as `DOT_{NAME}_RULES.md`). Staged rules are kept out of project commits via `.git/info/exclude`.

Bootstrap creates `~/.dotfilesrc` with an `AGENTS.md` guard so the hooks only fire in agent-enabled repos. It also sets `BASH_ENV` so non-interactive shells pick it up. Both `stage-rules` and `hydrate-agents` operate on the current working directory, not the dotfiles installation path.

AGENTS.md files are stored empty in the repo and hydrated at runtime. `script/dehydrate-agents` resets them back to empty before committing so diffs stay clean and content stays authoritative at runtime.

Run hydration manually with:

```sh
bash script/hydrate-agents
```

Run dehydration manually with:

```sh
bash script/dehydrate-agents
```

## Contents

### Cores

One who wears many hats.

<!-- CORES START -->

#### Black
- [⚫ Black](/cores/Black/ARCHITECT.md)

#### Blue
- [🔵 Blue](/cores/Blue/EXECUTIVE.md)

#### Cyan
- [🔷 Cyan](/cores/Cyan/EXECUTOR.md)

#### Gray
- [Urok](/cores/Gray/coder.md)

#### Green
- [🟢 Green](/cores/Green/ENGINEER.md)

#### Magenta
- [🟣 Magenta](/cores/Magenta/CATALYST.md)

#### Red
- [🔴 Red](/cores/Red/SENTINEL.md)

#### White
- [⚪ White](/cores/White/CONNECTOR.md)

#### Yellow
- [🟡 Yellow](/cores/Yellow/STEWARD.md)

<!-- CORES END -->

### Skills

<!-- SKILLS START -->
- [Audio Transcription](/skills/audio-transcription/SKILL.md)
- [Audiovisual Transcription](/skills/audiovisual-transcription/SKILL.md)
- [Checkpoint Comprehensive](/skills/checkpoint-comprehensive/SKILL.md)
- [Checkpoint Distill](/skills/checkpoint-distill/SKILL.md)
- [The Cooperative Initiative](/skills/co-operative-initiative/SKILL.md)
- [Codebase Analysis](/skills/codebase-analysis/SKILL.md)
- [Coding Bookmark](/skills/coding-bookmark/SKILL.md)
- [continuous-improvement-initiative](/skills/continuous-improvement-initiative/SKILL.md)
- [Docs Consistency](/skills/docs-consistency/SKILL.md)
- [Filename Generator](/skills/filename-generator/SKILL.md)
- [Lilypad Loop](/skills/lilypad-loop/SKILL.md)
- [Slack Personality Self-Assessment](/skills/mbti-self-assessment-slack/SKILL.md)
- [obsidian-md-cli-docs](/skills/obsidian-md-cli-docs/SKILL.md)
- [obsidian-md-cli-help](/skills/obsidian-md-cli-help/SKILL.md)
- [Repo to Prompt](/skills/repo-to-prompt/SKILL.md)
- [Round Table](/skills/round-table/SKILL.md)

<!-- SKILLS END -->

### Tools

<!-- TOOLS START -->
- [Company Reconnaissance](/tools/job_company_recon.md)
- [Cover Letter Checker](/tools/job_cover_letter_checker.md)
- [Resume Cover Letter Coach](/tools/job_cover_letter_coach.md)
- [Interview Chances](/tools/job_interview_chances.md)
- [Post-Interview Follow-Up Email Generator](/tools/job_interview_follow_up_email.md)
- [Interview Preparation Coach](/tools/job_interview_prep_coaching.md)
- [Job Recruitment Response Template ](/tools/job_recruitment_response_template.md)
- [Resume Proof Reading](/tools/job_resume_proof_reading.md)
- [LinkedIn Proof Reader](/tools/linkedin_proof_reader.md)
- [AntiSummary](/tools/llm_anti_summary.md)
- [Chain of Thought Meta-Prompting](/tools/llm_cot_meta_prompting.md)
- [Print Full Conversation](/tools/llm_print_full_conversation.md)
- [Slack Communication Analyzer](/tools/slack_comm_analyzer.md)

<!-- TOOLS END -->

## Resources

### Ecosystem 

- [OpenRouter SDK Skill](https://github.com/OpenRouterTeam/agent-skills)
- [OpenSkills Universal Loader](https://github.com/numman-ali/openskills)
- [Cloudflare Skills](https://github.com/cloudflare/skills)
- [Humanizer AI Slop Cleanup](https://github.com/blader/humanizer)
- [MotionSites Landing Page Builder with Ready-Made Prompts](https://motionsites.ai)
- [Skill Directory for OpenClaw](https://clawhub.ai)
- [BMad-Method](https://github.com/bmadcode/BMAD-METHOD)


### Links

- [Agent Skills Specification](https://agentskills.io)
- [Anthropic's Prompt Engineering](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)
- [Anthropic's Prompt Library](https://docs.anthropic.com/en/prompt-library/library)
- [Anthropic's Interactive Prompt Engineering Tutorial](https://github.com/anthropics/prompt-eng-interactive-tutorial)
