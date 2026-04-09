# Mind Dump — Debug Context Snapshot

**Generated:** 2026-04-09T12:40:31Z  
**Context Window Usage:** 14,423 / 200,000 tokens (7%)

---

## Identity

- **Agent:** Cline
- **Role:** Highly skilled software engineer with extensive knowledge in many programming languages, frameworks, design patterns, and best practices
- **IDE:** Cline CLI - Node.js
- **Mode:** ACT MODE

---

## System Information

- **Operating System:** Linux 6.8
- **Default Shell:** /bin/bash
- **Home Directory:** /home/codespace
- **Current Working Directory:** /workspaces/ai-runbook

---

## Workspace Configuration

```json
{
  "workspaces": {
    "/workspaces/ai-runbook": {
      "hint": "ai-runbook",
      "associatedRemoteUrls": [
        "origin: https://github.com/pbierkortte/ai-runbook"
      ],
      "latestGitCommitHash": "a3f761a1f5ff881bf9b9b7ca2cdaeddbe85a134f"
    }
  }
}
```

---

## Current Task

> "this is a simple request i sime need you tu dump you conext for debuging to mind_dump.md"

Interpreted as: write a debug context dump to `mind_dump.md`.

---

## Task Progress

- [x] Check if mind_dump.md exists (it did not)
- [x] Write context dump to mind_dump.md

---

## Project: ai-runbook

### Purpose

An AI runbook — a structured collection of cores (agent personas), skills, tools, rules, and scripts for configuring and operating AI agents.

### File Structure (at time of snapshot)

```
.gitignore
AGENTS.md
LICENSE
README.md
agents/
  openskills-manifest.yml
cores/
  Black/assessor.md
  Blue/director.md
  Evan/architect.md
  Evan/coder.md
  Evan/debugger.md
  Green/writer.md
  Maya/designer.md
  Maya/tester.md
  Orange/boss.md
  Otis/editor.md
  Otis/writer.md
  Red/critic.md
  White/researcher.md
  Yellow/advocate.md
docs/
  AGENTS.md
  agents-md-heading-format.md
  agents-md-rule-injection.md
  claude-code-codespaces-auth.md
  dev-setup.md
  LICENSE
  README.md
rules/
  add-header.md
  clean-up.md
  commit-conventionally.md
  create-rule.md
  explore-first.md
  fetch-rule.md
  keep-it-simple.md
  name-branch-with-ticket.md
  read-me.md
  reduce-punctuation.md
  update-project-registry.md
script/
  agents-collate.sh
  bootstrap
  dev-setup.sh
  env-vars.sh
  inject-rules.sh
  install-agents.sh
  install-deps.sh
  openskills-manifest.sh
  setup-skills.sh
  shell-hooks.sh
  update-contents.sh
  update-manifest.sh
skills/
  audio-transcription/SKILL.md
  audiovisual-transcription/SKILL.md
  checkpoint-comprehensive/SKILL.md
  checkpoint-distill/SKILL.md
  co-operative-initiative/SKILL.md
  codebase-analysis/SKILL.md
  continuous-improvement-initiative/SKILL.md
  filename-generator/SKILL.md
  lilypad-loop/SKILL.md
  mbti-self-assessment-slack/SKILL.md
  repo-to-prompt/SKILL.md
tools/
  job_company_recon.md
  job_cover_letter_checker.md
  job_cover_letter_coach.md
  job_interview_chances.md
  job_interview_follow_up_email.md
  job_interview_prep_coaching.md
  job_recruitment_response_template.md
  job_resume_proof_reading.md
  linkedin_proof_reader.md
  llm_anti_summary.md
  llm_cot_meta_prompting.md
  llm_print_full_conversation.md
  slack_comm_analyzer.md
```

---

## AGENTS.md Rules in Effect

### From `/workspaces/ai-runbook/AGENTS.md`

Auto-generated index of the README.md and docs. Covers:
- AI Runbook purpose and usage
- Dotfiles setup, CORES, environment variables
- Skills: naming, install, update, invoke, list
- Tools and adaptive indexing
- Cores: Black, Blue, Evan, Green, Maya, Orange, Otis, Red, White, Yellow
- Skills and Tools listings
- Resources and ecosystem links

### From `/workspaces/ai-runbook/docs/AGENTS.md`

Same content as root AGENTS.md (auto-generated mirror).

Also includes docs on:
- `agents-md-heading-format.md` — format structure, transformation rules, generation
- `agents-md-rule-injection.md` — rule injection overview, purpose, mechanism, effect, source
- `claude-code-codespaces-auth.md` — Claude Code auth for GitHub Codespaces
- `dev-setup.md` — entry point chain, scripts overview

---

## Available Skills

| Skill Name | Description |
|---|---|
| audio-transcription | Transcribe audio verbatim with speaker attribution |
| audiovisual-transcription | Transcribe audio verbatim with speaker attribution and chronological visual context |
| checkpoint-comprehensive | Capture session context into a comprehensive structured checkpoint for cross-session continuity |
| checkpoint-distill | Distilled session context into a structured checkpoint for cross-session continuity |
| co-operative-initiative | Multi-agent collaboration, pair programming, adversarial review, write-then-critique loops |
| codebase-analysis | Explores a codebase to produce a brief that transfers real understanding |
| continuous-improvement-initiative | (brief description not provided) |
| filename-generator | Generate a descriptive searchable filename from content |
| lilypad-loop | A session continuity loop where the frog is disposable but the pad is not |
| mbti-self-assessment-slack | Derives MBTI personality type from real Slack communication patterns |
| repo-to-prompt | Reverse-engineers technical repository data into a realistic user prompt |

---

## Available Tools (Cline)

| Tool | Purpose |
|---|---|
| execute_command | Run CLI commands |
| read_file | Read file contents |
| write_to_file | Create or overwrite files |
| replace_in_file | Targeted edits via SEARCH/REPLACE blocks |
| search_files | Regex search across files |
| list_files | List directory contents |
| list_code_definition_names | List source code definitions |
| use_mcp_tool | Use a connected MCP server tool |
| access_mcp_resource | Access a connected MCP server resource |
| ask_followup_question | Ask the user a clarifying question |
| attempt_completion | Present final result to user |
| plan_mode_respond | Respond in PLAN MODE |
| load_mcp_documentation | Load MCP server creation docs |
| use_skill | Activate a named skill |

---

## Detected CLI Tools

`gh`, `git`, `docker`, `kubectl`, `npm`, `yarn`, `pnpm`, `pip`, `go`, `curl`, `jq`, `make`, `cmake`, `python`, `node`, `sqlite3`, `code`, `grep`, `sed`, `awk`, `apt`, `gradle`, `mvn`, `bundle`, `dotnet`, `helm`, `wget`

---

## Active Terminals

None at time of snapshot.

---

## Open Files / Tabs

None at time of snapshot.

---

## Conversation History (this session)

1. **User:** "dump your context for debugging to mind_dump.md"
2. **Cline:** Checked if mind_dump.md exists → did not exist
3. **Cline:** Writing this file

---

## Key Behavioral Rules (summary)

- Working directory is fixed: `/workspaces/ai-runbook`
- Cannot `cd` without chaining with `&&`
- Use `replace_in_file` by default; `write_to_file` for new/large files
- Wait for user confirmation after every tool use
- Never start messages with "Great", "Certainly", "Okay", "Sure"
- Do not end `attempt_completion` with a question
- Pass `--` before positional args that may start with `-`
- Verify task requirements before calling `attempt_completion`
- After bug fixes, run existing test suite (not just a reproduction script)
- MCP operations one at a time

---

## MCP Servers

None configured / none detected at time of snapshot.