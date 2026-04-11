# Commit Conventionally

The Conventional Commits format with JIRA ticket integration enables automated changelog generation, efficient code history review, and seamless integration with project management tools.

## Always
- Actual ticket: Ask if ticket is unclear
- JIRA ticket inclusion: Include in parentheses after type
- 50 character limit: Keep message under this limit
- Format compliance: Use `type(JIRA-TICKET): Verb component description`
- JIRA ticket clarification: Ask if unclear from branch name
- Imperative verb usage: Start description with imperative verb
- Commit universality: Apply to every single commit
- File review: Review staged changes before committing 
- Type selection: Choose from feat, fix, docs, style, refactor, test, chore

## Never
- Fake ticket: never make one up
- JIRA ticket omission: Omit ticket number
- Character limit violation: Exceed 50 characters
- JIRA ticket assumption: Skip asking if unclear from branch name
- Non-imperative tense: Use past/present tense
- Format inconsistency: Deviate from ticket format
- Secret commits: Commit secrets (unless explicitly requested)

## Steps
1. From branch name: Get JIRA ticket (`git branch --show-current`)
2. Staged changes: Review changes (`git --no-pager diff --staged`)
3. Change explanation: Explain what changed and why
4. File addition: Add relevant files
5. Construct message: Follow required format
6. Message review: Show constructed message in chat
7. Commit execution: Only after verification

## Examples

✅ Good: `feat(TICKET-123): Add user authentication system`

✅ Good: `fix(BUG-456): Fix memory leak in data processor`

✅ Good: `docs(DOC-789): Update API integration guide`

❌ Bad: `Added new feature for user login` (no JIRA ticket, exceeds 50 chars)

❌ Bad: `fix: memory leak` (no JIRA ticket)

❌ Bad: `feat(TICKET-123): Added user authentication system with OAuth integration and session management` (exceeds 50 chars)

❌ Bad: `refactor(TODO-999): Clean up code` (fake ticket)

❌ Bad: `update(TICKET-123): Update dependencies` (fake type)

❌ Bad: `chore: Initial commit` (assumed no ticket needed)

---
