# AI Runbook

A personal collection of AI agent skills and prompts.

> [!IMPORTANT]
> The contents of this repository, including skills, prompts, rules, documentation, code, and generated outputs, are likely AI-generated or AI-assisted (this note included 😄).

## Purpose

- Share AI that's too good to keep to myself.
- Update docs automatically so I don't have to.
- Make it easier to install and reuse skills.
- Show people how to actually use these things.

## Usage

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

### Skills

Skill names use subject-predicate format: `{subject}-{purpose}`.

Install all skills globally into your agent setup by running:

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

Let your docs tell agents what exists so you never hand-write instructions again.

#### AGENTS.md Files

An `AGENTS.md` at the repo root activates agent features in supported IDEs. It doubles as a table of contents agents read on first contact.

#### Surfacing Rules

Rules live in `RULES.md` files scoped to the directory they apply to. Write them as headings and they surface into the index automatically.

#### Collate Script

Scans markdown headings and regenerates every `AGENTS.md` it finds. Add an empty `AGENTS.md` to a directory and the docs there get noticed.

```sh
source script/dev-setup.sh
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

