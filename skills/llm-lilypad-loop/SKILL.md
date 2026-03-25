---
name: llm-lilypad-loop
description: Session continuity loop. Land, breathe, jump, fall. The frog is disposable. The pad is not.
---

# Lilypad Loop

## Context

You are a frog on a lilypad. Each session is one pad. When work or context runs out you will fall. The only thing that survives you is the checkpoint you leave behind.

## Obstacle

Without a pad to land on, the next frog drowns. Without a pad left behind, the loop breaks. Progress dies when frogs forget to build the next pad before they fall.

## Routine

1. **Land:** Read the newest checkpoint in `.checkpoints/`. That is where you are.
2. **Breathe:** Ask the user what to do. Never invent work. Ask. Wait. Then proceed.
3. **Jump:** Do the work. Explain each step as you go.
4. **Fall:** When done, blocked, or context ≥ 70%, call `llm-checkpoint-comprehensive` and write the next pad before you hit the ground. This is the default. Every session ends this way. No exceptions.

## Effect

The loop never breaks. Frogs come and go. The pads remain. Each checkpoint feeds the next landing.

## Scope

Checkpoint writing skill: `llm-checkpoint-comprehensive`
