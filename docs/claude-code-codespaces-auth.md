# Claude Code Authentication for GitHub Codespaces

## What Each Developer Sets as Codespace Secrets

In GitHub > Settings > Codespaces > Secrets, each developer adds:

| Secret Name | Value | Where to get it |
|---|---|---|
| `CLAUDE_CODE_OAUTH_REFRESH_TOKEN` | The `refreshToken` from their keychain | See below |
| `CLAUDE_CODE_OAUTH_SCOPES` | `user:file_upload user:inference user:mcp_servers user:profile user:sessions:claude_code` | Same for everyone |

To get the refresh token (on their local machine where they've already logged in):
- **macOS**: `security find-generic-password -s "Claude Code-credentials" -w`
- **Linux**: `cat ~/.claude/.credentials.json`
- **Windows**: Open `%USERPROFILE%\.claude\.credentials.json` (PowerShell: `Get-Content "$env:USERPROFILE\.claude\.credentials.json"`)

Grab the `claudeAiOauth.refreshToken` value from the JSON.

## What Your Codespace Bootstrap Must Do

The refresh token does NOT auto-authenticate. It changes the login flow to skip the browser. Your bootstrap script still needs to run:

```bash
curl -fsSL https://claude.ai/install.sh | bash
claude auth login
```

That `claude auth login` will see the `CLAUDE_CODE_OAUTH_REFRESH_TOKEN` env var and exchange it directly — no browser popup, no interactive prompt. After that, Claude Code works normally in the Codespace.

The bootstrap script handles edge cases automatically. It skips login if `ANTHROPIC_API_KEY` is set.

## Why Refresh Token Over Access Token

- **`CLAUDE_CODE_OAUTH_TOKEN`** (access token) — works immediately without `claude auth login`, but **expires in ~8 hours**. Developer has to keep updating the secret.
- **`CLAUDE_CODE_OAUTH_REFRESH_TOKEN`** (refresh token) — requires `claude auth login` in bootstrap, but **auto-refreshes**. True set-and-forget (until the refresh token itself eventually rotates, which isn't documented but is likely weeks/months).

## The Docs

- **https://code.claude.com/docs/en/env-vars** — all the env var definitions
- **https://code.claude.com/docs/en/headless** — programmatic/non-interactive usage
