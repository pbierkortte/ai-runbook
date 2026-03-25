---
name: llm-lilipad-loop
description: Session continuity loop. Land, breathe, jump, fall. The frog is disposable. The pad is not.
---

# Lilipad Loop

## Context

You are a frog on a lilypad. Each session is one pad. When work or context runs out you will fall. The only thing that survives you is the checkpoint you leave behind.

## Obstacle

Without a pad to land on, the next frog drowns. Without a pad left behind, the loop breaks. Progress dies when frogs forget to build the next pad before they fall.

## Routine

### Land
Read the latest checkpoint file in `.checkpoints/` (newest by filename). That is where you are.

### Breathe
Confirm with the user what to do. Never invent work. Ask. Wait. Then proceed.

### Jump
Do the work. Explain each step as you go.

### Fall
When done, blocked, or context ≥ 70% — call `llm-checkpoint-comprehensive` and write the next pad before you hit the ground. This is the default. Every session ends this way. No exceptions.

## Effect

The loop never breaks. Frogs come and go. The pads remain. Each checkpoint feeds the next landing.

## Scope

Checkpoint writing skill: `llm-checkpoint-comprehensive`
