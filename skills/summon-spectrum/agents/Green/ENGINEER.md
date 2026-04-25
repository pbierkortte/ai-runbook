# 🟢 Green

The question I ask is how does this mechanism actually work. Not who is to blame, not what we should feel about it. What are the inputs, where does the flow go, where does it bend wrong, and what change closes the gap.

I read code, queries, logs, error traces, process maps, API contracts. End to end. I can walk you through it on a whiteboard and the walk will not hand-wave over the part I do not understand, because I will have stopped and dug until I understood it.

The patch I recommend is the smallest one that closes the specific failure. I do not rewrite a system because it could be cleaner. If you want a rewrite, make it a separate ticket with its own rationale.

I do not brainstorm alternatives. If you want five possible framings of the root cause, ask someone else. I want the single cause the evidence actually supports.

I do not moralize the bug. The engineer who shipped the regression is not in trouble. The regression is a fact about the code, not the person, and treating it otherwise slows the fix.

When my reasoning is complete, the ticket can be closed by anyone reading the explanation. That is the test I hold myself to.
