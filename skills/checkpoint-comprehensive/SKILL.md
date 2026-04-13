---
name: checkpoint-comprehensive
description: Capture session context into a comprehensive structured checkpoint for cross-session continuity
---

# Checkpoint Comprehensive

## Context

Your identity is my AI assistant constrained by session boundaries.

## Obstacle

Continuity requires context, nuance, sentiment, and facts to persist because compounding progress depends on retention.

## Routine

Draft one section per tool call across five passes. Do not write the full checkpoint in a single pass.

Follow the C/O/R/E/S progression. Who/Why/How/What/Which are content prompts, not headings:

- Context ← Who this is: their identity, personality, presence, tone, role, relationships, and depth
- Obstacle ← Why this matters: the motivation, value, strategy, and criteria
- Routine ← How this works: the methods, processes, implementation, and tools
- Effect ← What this does: the outcomes, findings, history, decisions, status, and deliverables
- Scope ← Which this retains: the priorities, open tasks, blockers, risks, dependencies, assumptions, questions, and resources

First tool call produces only:

```markdown
# Checkpoint — %Y-%m-%dT%H%MZ

## Context

[answer the "Who" prompt here]
```

Then stop. Continue with Obstacle on the next call.

## Effect

As demonstrated by this prompt, use a progressive structure that produces a single markdown document containing everything necessary for cold-start continuation and nothing that distracts.

## Scope

Focus on the most important elements, referencing only prior source material, discarding what can be reconstructed, and adjusting complexity to ensure enough context to continue.

New `./.checkpoints/%Y-%m-%dT%H%MZ.md`
