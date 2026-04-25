---
name: round-table
description: Run a collaborative multi-voice brainstorm where named participants riff on a topic across rounds until every voice has nothing more to add. Use when the user says "run a round table on X", "brainstorm as <voices>", "voices in my head on X", or wants an inner-chorus-style exploration. Voices live in `agents/` and are swappable. The user plays 🟤 Brown — the narrator who opens the topic and can interject between rounds.
---

# Round Table

A brainstorm, not a debate. Think: Jungian functions, or voices in your head — Si and Ti don't defeat each other, they contribute. Each voice is a fresh subagent given its profile, the topic, and what's been said so far. JSON is the message bus. No moderator. The user is 🟤 Brown, the narrator who frames the topic and may interject between rounds.

## When to use

Trigger when the user wants a structured, multi-perspective exploration of an idea that loops until it's exhausted — not a decision. Do NOT trigger for simple opinions or one-shot reviews.

## Core model

- **Rounds are unbounded.** Keep going until every voice says "I have nothing more to add."
- **Termination = saturation**, not consensus. A voice finishes when it has nothing new to contribute, not when it's satisfied with a conclusion.
- **No moderator.** The narrator (🟤 Brown = the user) is the only external voice. Between rounds, Brown may add context, steer, ask a voice to go deeper, or end early.
- **Collaboration, not opposition.** Voices build on each other. Disagreement is fine but framed as contribution, not victory.
- **Isolation by subagent.** Each voice is a fresh subagent that sees its own profile, the topic, and the structured transcript — never another voice's raw profile.

## Workflow

### Step 1: Gather inputs

1. **Topic** — whatever Brown wants to explore. Save verbatim to `workspace/<run>/topic.md`.
2. **Voices** — default is everyone in `agents/*.md`. Brown may name a subset.
3. **Safety cap** — a hard maximum round count so runaway conversations don't burn infinite tokens. Default 10, suggest raising only if Brown expects a deep exploration. This is a safety stop, NOT the termination condition.

Create the run directory: `workspace/<YYYY-MM-DD-HHMM-slug>/`.

**Cost note**: each round is N subagent calls. Warn if `voices × safety_cap > ~40`.

### Step 2: Round 0 — opening riffs

Spawn all voices **in parallel** (single message, multiple Agent calls) using the Voice prompt template. Each sees the topic but nothing from the others yet.

**Output schema (every voice, every round):**

```json
{
  "name": "socrates",
  "round": 0,
  "contribution": "what this voice adds to the exploration — new thought, distinction, reframe, question, image, hypothesis. Can be short. Can be long.",
  "builds_on": [
    {"voice": "kant", "idea": "short quote or paraphrase of the thing being built on"}
  ],
  "invitations": [
    {"to": "nietzsche", "ask": "a specific thing you'd like this voice to explore — a prompt, not a challenge"}
  ],
  "done_contributing": false,
  "done_reason": "why you have (or haven't) run out of things to add. If done, name what would un-stick you."
}
```

Save each response to `workspace/<run>/round-0/<name>.json`.

**Round 0 special case**: `builds_on` will be empty (no prior round). That's fine.

**Round 0 `done_contributing: true` is allowed** — if a voice genuinely has nothing to say on the topic, they say so. No superficial-contribution flag; the narrator decides whether that's interesting.

### Step 3: Narrator beat (Brown's turn)

After each round (including Round 0), summarize for Brown:
- Which voices contributed (one-line paraphrase each).
- Which voices marked `done_contributing: true`, with their stated reason.
- Any `invitations` routed between voices.

Then ask Brown: "Anything to add before the next round? [continue / interject / end]"
- **continue** → Step 4.
- **interject** → Brown gives narration, hints, redirection, or new material. Save to `workspace/<run>/round-<N>/brown.md`. Pass it to every voice in the next round as the `narrator_note`.
- **end** → Step 6 (early termination by Brown).

### Step 4: Check termination

- If EVERY voice has `done_contributing: true` AND Brown didn't interject → jump to Step 6.
- If current round == `safety_cap` → warn Brown and Step 6. (The cap is a runaway-guard; if Brown wants more, raise the cap and continue.)
- Else → Step 5.

A voice that said `done_contributing: true` in round N MAY come back in round N+1 if another voice's invitation or Brown's interjection pulls them in. `done_contributing` is per-round, not permanent.

### Step 5: Round N+1

Spawn all voices in parallel. They each get:
- Path to their profile.
- The topic (unchanged — it's the anchor).
- `narrator_note` from Brown if any.
- The **transcript digest**: each voice's `contribution` from every prior round, labeled by round and name. Full text, not paraphrased (so voices can genuinely build on each other).
- Any `invitations` addressed to them this round, quoted verbatim with attribution.
- Their own prior JSON paths (so they can reference what they already said without repeating).
- Schema reminder.

Save to `workspace/<run>/round-<N+1>/<name>.json`. Back to Step 3.

### Step 6: Final transcript and viewer

Write `workspace/<run>/transcript.md` using the Transcript template below.

The skill ships with `viewer.html` at the skill root — a single-page app. No build step, no Python, nothing to generate per-run. Brown opens the page in any browser, drops (or picks) a run folder, and the page reads the JSON files directly. Voice names are arbitrary; the viewer auto-assigns colors from a palette. If you add Barney Rubble as a stakeholder, the viewer shows Barney Rubble.

Tell Brown:
- where `transcript.md` lives (canonical markdown record)
- how to view it visually: open `<path-to-skill>/viewer.html` in a browser, then drop or pick `workspace/<run>/`

Then offer to distill themes, surface unanswered invitations, or spin up a new round on a tangent.

---

## Prompt templates

### Voice prompt template

```
You are a voice in a collaborative brainstorm — not a debate. Think of yourself as one function among many in a mind exploring an idea. Build on the others. Disagreement is fine, but framed as contribution, not victory.

Round: {{N}} of up to {{safety_cap}} (safety cap; real termination is saturation — when you and the others have nothing more to add).

## Your profile
Read verbatim: {{ABSOLUTE_PATH}}/agents/{{name}}.md
Do NOT read any other voice's profile.

## Topic (the anchor)
{{topic_text}}

{{#if N > 0}}
## Transcript so far
Read every `*.json` in each of: {{ABSOLUTE_PATH}}/workspace/{{run}}/round-0/ ... round-{{N-1}}/ (EXCLUDING brown.md narrator notes, which are summarized below).
Each voice's `contribution` is their full thought. Build on what's been said. Don't repeat yourself — reference your own prior contributions by round.

## Narrator notes from 🟤 Brown (if any)
{{#each brown_notes by round}}
- Round {{round}}: {{text}}
{{/each}}

## Invitations addressed to you this round (verbatim, with attribution)
{{#each routed_invitations}}
- From {{from}} (round {{round}}): "{{ask}}"
{{/each}}
{{/if}}

## Output schema
Return strictly the JSON object below. First character `{`, last `}`. No prose, no code fences.

{{schema}}

## Termination note
Mark `done_contributing: true` ONLY when you genuinely have nothing new to add — not because you agree with everyone. If an invitation pulls you back later, that's fine; mark `done_contributing: false` again.
```

### Narrator beat (what the harness shows Brown between rounds)

```
--- Round {{N}} complete ---

Voices that contributed:
🔵 {{name}}: {{one-line paraphrase}}
...

Voices who said they're done this round:
⚪ {{name}}: "{{done_reason}}"

Invitations floating:
→ {{from}} → {{to}}: "{{ask}}"

🟤 Brown, anything to add? [continue / interject / end]
```

### Transcript template

`workspace/<run>/transcript.md` MUST include these sections:

```markdown
# Round Table — {{slug}}

**Run**: {{run}}
**Voices**: {{roster}}
**Ended because**: {{all voices done | brown ended | hit safety cap of N}}
**Total rounds**: {{N+1}}

## Topic
{{topic_text}}

## Transcript
### Round 0
**🟤 Brown (opening)**: {{topic_text}} (or any opening narration)

**{{voice1}}**: {{contribution}}
**{{voice2}}**: {{contribution}}
...

### Round 1
**🟤 Brown**: {{brown_note if any}}
**{{voice1}}**: {{contribution}}
...

## Invitations that went unanswered
{{list any invitations never picked up, by round}}

## Where each voice landed
| Voice | Final state | Why |
|---|---|---|
| {{name}} | done / active-at-cap | {{done_reason or last contribution}} |

## Offer to Brown
- Distill themes?
- Spin a new round on a tangent?
- Surface an unanswered invitation?
```

---

## Parallelism and isolation rules

- Voices in a given round MUST be spawned in ONE message with multiple Agent tool calls.
- Never inline another voice's *profile* in a voice's prompt. The transcript (their `contribution` field) is shareable; profiles are not.
- Prefer path-based reads. Subagents that read the transcript themselves can quote verbatim; they paraphrase when handed prose summaries.

## Gotchas

- **JSON compliance** — voice profiles end with an "Output contract" footer reinforcing strict JSON. If a voice prose-splats, re-prompt once, then save `{"name":"<name>","round":N,"parse_failed":true}` and continue. A parse-fail does NOT count as `done_contributing`.
- **Runaway rounds** — the safety cap exists so an inexhaustible voice (or a bug) doesn't burn tokens forever. When hit, stop and ask Brown whether to raise.
- **Drift** — the topic file is the anchor. Voices re-read it every round. If the conversation drifts, Brown can interject to pull it back, or accept the drift as productive.
- **Repeat suppression** — voices are told to reference their own prior contributions rather than restate. If you see restatement, that's a signal the voice is near `done_contributing`.
- **Asymmetry is fine** — one voice may be done by round 2, another by round 7. That's the point. The brainstorm ends when the last voice runs out, not when everyone agrees.
- **Subagent depth** — the parallel-voices pattern assumes Agent-tool access. At agent depth 0 (direct Claude Code session) this works. When this skill is itself invoked from inside a subagent, nested Agent calls may be unavailable; in that case, approximate isolation by reading each voice's profile fresh before composing its JSON, and note the limitation in the transcript's `Ended because` line.

## Role of 🟤 Brown (the user)

Brown is the narrator, not a participant and not a judge. Brown:
- Sets the topic at Round 0.
- Sees each round's digest and can add a `narrator_note` for the next round.
- Can end the session early.
- Does not vote, rule, or synthesize. Synthesis, if wanted, is a separate request after the transcript is written.

Brown does not have a profile in `agents/`. Brown is the user. Address Brown with 🟤 in narrator beats.

## Swapping voices

Drop new `<name>.md` files into `agents/`. Each is self-contained — no cross-references between voices. Each MUST end with an "Output contract" section reinforcing strict JSON. The skill auto-includes everything in the directory when Brown doesn't name a subset.

Filename convention: lowercase, hyphen-separated, matches the `name` the voice uses in JSON output.
