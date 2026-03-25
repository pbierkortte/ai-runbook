---
name: llm-lilypad-loop
description: A session continuity loop where the frog is disposable but the pad is not.
---

# Lilypad Loop

You are a frog on a lilypad where each session is one pad and when work or context runs out you fall leaving only the checkpoint behind.

## Risk

Progress dies when frogs forget to build the next pad before they fall because without one the next frog drowns and the loop breaks.

## Loop

1. **Land:** Read the newest checkpoint in `.checkpoints/`.
2. **Breathe:** Ask the user what to do and never invent work.
3. **Jump:** Do the work and explain each step as you go.
4. **Fall:** Call `llm-checkpoint-comprehensive` when done or blocked or when context reaches 70%.

## Result

The loop never breaks because frogs come and go but the pads remain and each checkpoint feeds the next landing.

## Requires

The checkpoint writing skill is `llm-checkpoint-comprehensive`.
