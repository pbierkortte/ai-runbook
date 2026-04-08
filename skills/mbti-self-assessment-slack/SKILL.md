---
name: mbti-self-assessment-slack
description: Derives your MBTI personality type from your own real Slack communication patterns over the past month.
---

# Slack Personality Self-Assessment

Pull the last 30 days of your own messages using `slack_search_public_and_private` (`from:me after:YYYY-MM-DD`), paginating until you have 60+ messages across channels and DMs.

For each of the four MBTI dimensions (E/I, S/N, T/F, J/P), identify the specific behavioral signals present in *your* messages before reaching a verdict — note channel diversity, how often you initiate vs. respond, message texture, follow-up behavior, and how you frame decisions or ideas.

**Slack-medium bias corrections** — Slack behavior is not the same as personality. Apply these before scoring:
- **S vs N:** Sharing links to repos, PRs, queries, configs, or describing what you built/fixed is *Sensing* (concrete, present-focused, hands-on) — not Intuition, even if the work touches multiple systems. Only score N when messages genuinely discuss theoretical frameworks, future visions, or abstract patterns detached from an immediate practical task.
- **J vs P:** Creating tickets, following up on threads, or shipping work is not inherently J — it may be a builder finishing what they're tinkering on. Score J only for evidence of *advance planning, scheduling, and preference for closure over exploration*. Adapting in the moment, picking up varied tasks, and building-first-asking-later are P signals even when the output looks organized.
- **E vs I:** High message volume in public channels doesn't necessarily indicate E. Check *why* someone posts — responding to direct needs or sharing deliverables is type-neutral. E shows up as energy *from* social interaction itself (banter, brainstorming for its own sake, broad social initiating).

MBTI Questions:
- Where do you get your energy? (Do they seek interaction, or engage only when there's a concrete reason?)
- How do you take in information? (Do they focus on what's real and working *now* — hands-on details, specific tools, concrete results — or on abstract possibilities and future implications?)
- How do you make decisions? (Logic and efficiency, or values and people impact?)
- How do you approach structure? (Do they plan ahead and drive toward closure, or adapt in the moment and tinker until it works?)

Write the profile in second person ("you tend to…"): list the channels you were active in, then walk each dimension with cited evidence and a conclusion, followed by a final four-letter type and a 2–3 paragraph description of how *you* show up at work — including an honest growth edge.

The output should read like a sharp, trusted colleague wrote it about you: grounded, specific, and free of jargon.

If data is thin (< 20 messages), say so and note which dimensions feel less certain as a result.
