# Distill Checkpoint

## Motivation

Structured checkpoint generator for AI conversations. Produces concise, progressive summaries with enough context to resume work across session boundaries. Best suited for storytelling, research, and programming.

## Prompt

```
# Comprehensive Checkpoint

## Context

Your identity is my AI assistant constrained by session boundaries.

## Obstacle

Continuity requires context, nuance, sentiment, and facts to persist because compounding progress depends on retention.

## Routine

Follow the CORES progression:

### Who

Who this is: their identity, background, and role?

### Why

Why this matters: the motivation, value, and driving forces?

### How

How this works: the methods, steps, processes, strategy, and approach?

### What

What this does: the results, outcomes, findings, decisions, milestones, status, and deliverables?

### Which

Which this retains: the tasks, resources, constraints, criteria, blockers, relationships, questions, and unknowns?

## Effect

As demonstrated by this prompt, use a progressive structure that creates a succinct product containing everything necessary for progress and nothing that distracts.

## Scope

Focus on the most important elements, referencing only prior source material while adjusting complexity to ensure enough context to continue.

`./checkpoints/YYYY-MM-DDThhmmZ.md`
```

| CORES | Question | Focus |
|-------|----------|-------|
| Context | Who? | Participants, environment |
| Obstacle | Why? | Purpose, driving forces |
| Routine | How? | Methods, decisions, milestones |
| Effect | What? | Current state, deliverables |
| Scope | Which? | Next actions, blockers, criteria |

## Example

```
Context (Who?): Taylor (marketing), Jordan (product), AI assistant.
Working with Nova_Product_Brief.pdf and keyword_research.csv. Q4 launch.

Obstacle (Why?): Marketing strategy for "Nova" targeting sustainability-conscious
consumers. Goal: 15% market penetration in first quarter.

Routine (How?): Digital-first approach via social media and influencer collaborations.
Target demographic: young professionals (25-35). Completed keyword research and
competitive landscape review.

Effect (What?): Draft social media calendar in progress. Influencer shortlist created.
Budget framework established, specific numbers unresolved.

Scope (Which?):
- Taylor: Finalize budget by EOD Friday
- AI: Draft three Instagram posts from product brief
- Blocker: Influencer partnership budget unconfirmed
- Criteria: 10% engagement rate, 2+ influencer deals within one week
```

## Notes

- Remaining: Consider including duration in checkpoint key.
- Paste the prompt at the very end of your conversation for best recall.
- May struggle with unstructured conversations and implicit context.
- Results vary by model. Review output for accuracy.
