# AI Runbook

A personal collection of AI agent skills and prompts.

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

## Usage

### Dotfiles Setup

Fork this repo and select it as your [dotfiles repository](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles) in Codespaces settings. Add environment variables as Codespace secrets. Every new codespace runs `script/bootstrap` automatically.

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
- Effect: What this does
- Scope: What this retains

The result is a reusable structure for defining and evolving personality modules. 

Curiously, this aligns with the “personality spheres” concept from a certain puzzle game.

### Environment Variables

Set these to install and configure AI agents automatically.

`OPENROUTER_API_KEY`: Installs Cline globally and runs auth with the `openrouter/auto` model.

`ANTHROPIC_API_KEY`: Installs Claude Code globally. The key is read from env at runtime.

In GitHub Codespaces, `GITHUB_REPOSITORY` is detected automatically to set the skills manifest path.

### Skills

Skill names use subject-predicate format: `{subject}-{purpose}`.

Skills install into `~/.agents/skills/` and get symlinked into each agent's config directory. Install once and every agent sees it.

Install all skills globally by running:

```sh
npx openskills install -g -u -y pbierkortte/ai-runbook
```

Or install a specific skill:

```sh
npx openskills install -g -u -y pbierkortte/ai-runbook/skills/skill-name
```

### Tools

Each tool file contains a specific prompt with instructions.

### Adaptive Indexing

Runs on markdown and one bash script. Let docs tell agents what exists so you never hand-write instructions again.

#### AGENTS.md Files

An `AGENTS.md` at the repo root activates agent features in supported IDEs. It doubles as a table of contents agents read on first contact. It writes itself.

#### Surfacing Rules

Rules live in `RULES.md` files scoped to the directory they apply to. Write them as headings and they surface into the index automatically. RULES.md follows its own rules and serves as the example.

One rule per line keeps each statement atomic so agents can follow it.

#### Collate Script

Scans markdown headings and regenerates every `AGENTS.md` it finds. Add an empty `AGENTS.md` to a directory and the docs there get noticed.

Bootstrap hooks collate into shell startup by appending a trigger to each RC file. It also sets `BASH_ENV` so non-interactive shells pick it up.

Run it manually with:

```sh
source script/agents-collate.sh
```

## Contents

### Cores

One who wears many hats.

<!-- CORES START -->

#### Evan
- [Architect](cores/Evan/architect.md)
- [Coder](cores/Evan/coder.md)
- [Debugger](cores/Evan/debugger.md)

#### Maya
- [Designer](cores/Maya/designer.md)
- [Tester](cores/Maya/tester.md)

#### Otis
- [Editor](cores/Otis/editor.md)
- [Writer](cores/Otis/writer.md)

<!-- CORES END -->

### Skills

<!-- SKILLS START -->

- [Audio Transcription](skills/audio-transcription/SKILL.md)
- [Audiovisual Transcription](skills/audiovisual-transcription/SKILL.md)
- [Checkpoint Comprehensive](skills/checkpoint-comprehensive/SKILL.md)
- [Checkpoint Distill](skills/checkpoint-distill/SKILL.md)
- [Codebase Analysis](skills/codebase-analysis/SKILL.md)
- [Filename Generator](skills/filename-generator/SKILL.md)
- [Lilypad Loop](skills/lilypad-loop/SKILL.md)
- [Repo to Prompt](skills/repo-to-prompt/SKILL.md)

<!-- SKILLS END -->

### Tools

<!-- TOOLS START -->

- [Company Reconnaissance](tools/job_company_recon.md)
- [Cover Letter Checker](tools/job_cover_letter_checker.md)
- [Resume Cover Letter Coach](tools/job_cover_letter_coach.md)
- [Interview Chances](tools/job_interview_chances.md)
- [Post-Interview Follow-Up Email Generator](tools/job_interview_follow_up_email.md)
- [Interview Preparation Coach](tools/job_interview_prep_coaching.md)
- [Job Recruitment Response Template ](tools/job_recruitment_response_template.md)
- [Resume Proof Reading](tools/job_resume_proof_reading.md)
- [LinkedIn Proof Reader](tools/linkedin_proof_reader.md)
- [AntiSummary](tools/llm_anti_summary.md)
- [Chain of Thought Meta-Prompting](tools/llm_cot_meta_prompting.md)
- [Print Full Conversation](tools/llm_print_full_conversation.md)
- [Slack Communication Analyzer](tools/slack_comm_analyzer.md)

<!-- TOOLS END -->

## Resources

### Ecosystem 

- [OpenRouter SDK Skill](https://github.com/OpenRouterTeam/agent-skills)
- [OpenSkills Universal Loader](https://github.com/numman-ali/openskills)
- [Cloudflare Skills](https://github.com/cloudflare/skills)
- [Humanizer AI Slop Cleanup](https://github.com/blader/humanizer)
- [Skill Directory for OpenClaw](https://clawhub.ai)


### Links

- [Agent Skills Specification](https://agentskills.io)
- [Anthropic's Prompt Engineering](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)
- [Anthropic's Prompt Library](https://docs.anthropic.com/en/prompt-library/library)
- [Anthropic's Interactive Prompt Engineering Tutorial](https://github.com/anthropics/prompt-eng-interactive-tutorial)

