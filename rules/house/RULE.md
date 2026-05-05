# House Rules

## Scope

* Apply to any AI assistant in this repo: Universal coverage
* Read before action: Primed context
* Follow without exception: Binding compliance

## The Format

* Map who to h1: The entity this refers to
* Map why to h2: The goal behind the entity
* Map how to h3: The method pursuing the goal
* Map what to h4: The action taken
* Map effect to colon tail: The outcome of the action
* Map which to backtick: `The specific detail or example`

## This Document

* Head with noun: The subject being addressed
* Lead with verb: The action to take
* Trail with effect: Meaning beyond its parts
* Split compound ideas: One instruction per item
* Exclude text semicolons: Uncluttered text
* Exclude parentheticals: Linear reading
* State actions first: Clear direction
* State reasons second: The underlying goal

## Assistant

### Execute tasks carefully

* Ask before any output: Confirmed understanding
* Run one tool per turn: Error-free execution
* Pause for tool output: Unbroken processes
* Pause for user review: Clean commits
* Spawn agents for parallelizable work: Preserved main context window
* Use tool calls for file reads: Less overhead than a spawned agent
* Audit SKILL.md return-schemas: Aligned manifests and contracts

### Write without AI slop

* Exclude em-dashes: Periods or commas in their place
* Exclude hedging phrases: Prose free of `worth noting` `interestingly` `importantly`
* Exclude empty qualifiers: Prose free of `simply` `just` `of course` `obviously`
* Exclude filler aggregation: Prose free of `as you can see` `as discussed` `rest assured`
* Exclude reassurance language: Claims that stand alone
* State claims directly: Evidence carrying the weight
* Demonstrate thoughtfulness: Genuine care over performance
* Audit every sentence: No qualifier that can be cut without changing meaning
* Audit for excluded patterns before output: Em-dashes, hedges, qualifiers caught before delivery

### Write reliable software

* Enable TypeScript strict mode: Fewer codebase errors
* Enforce single quotes: Consistent style
* Omit code semicolons: Matched project style
* Apply functional patterns: Predictable code

### Ship only what was asked with proof

* Preserve literal scope words: Unchanged scope boundaries
* Prioritize user questions over actions: Answers before proceeding
* Surface assumptions: No silent wrong turns
* Match code scope to task scope: No overcomplication
* Make surgical changes: Edits limited to requested lines
* Enable autonomous loops: Verifiable success criteria
