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

Install all skills into your agent setup by running:

```sh
npx skills add pbierkortte/ai-runbook
```

Or install a specific skill:

```sh
npx skills add pbierkortte/ai-runbook --skill "skill-name"
```

### Tools

Each tool file contains a specific prompt with instructions.

## Contents

### Skills

<!-- SKILLS START -->

* [Distill Checkpoint](skills/llm-distill-checkpoint/SKILL.md)
* [Generate Descriptive Filename](skills/llm-name-file/SKILL.md)
* [Verbatim Audio Transcription](skills/llm-transcribe-audio/SKILL.md)

<!-- SKILLS END -->

### Tools

<!-- TOOLS START -->

* [Company Reconnaissance](tools/job_company_recon.md)
* [Cover Letter Checker](tools/job_cover_letter_checker.md)
* [Resume Cover Letter Coach](tools/job_cover_letter_coach.md)
* [Interview Chances](tools/job_interview_chances.md)
* [Post-Interview Follow-Up Email Generator](tools/job_interview_follow_up_email.md)
* [Interview Preparation Coach](tools/job_interview_prep_coaching.md)
* [Job Recruitment Response Template ](tools/job_recruitment_response_template.md)
* [Resume Proof Reading](tools/job_resume_proof_reading.md)
* [LinkedIn Proof Reader](tools/linkedin_proof_reader.md)
* [AntiSummary](tools/llm_anti_summary.md)
* [Chain of Thought Meta-Prompting](tools/llm_cot_meta_prompting.md)
* [Print Full Conversation](tools/llm_print_full_conversation.md)
* [Slack Communication Analyzer](tools/slack_comm_analyzer.md)

<!-- TOOLS END -->

## Resources

### Ecosystem 

* [OpenRouter SDK Skill](https://github.com/OpenRouterTeam/agent-skills)
* [Cloudflare Skills](https://github.com/cloudflare/skills)
* [Skill Directory for OpenClaw](clawhub.ai)


### Links

- [Agent Skills Specification](https://skills.md)
- [Anthropic's Prompt Engineering](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)
- [Anthropic's Prompt Library](https://docs.anthropic.com/en/prompt-library/library)
- [Anthropic's Interactive Prompt Engineering Tutorial](https://github.com/anthropics/prompt-eng-interactive-tutorial)
