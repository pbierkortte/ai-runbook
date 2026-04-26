# Dotfiles Opt-In

## What It Is

`DOTFILES_ENABLE` is a feature flag that activates the full dotfiles install sequence. When set, `script/bootstrap` runs every install step. When absent, the codespace starts untouched.

## Why It Exists

Not every codespace should run the dotfiles setup. The flag gives developers explicit control over which codespaces get the full environment configured.

## How to Set It

Add `DOTFILES_ENABLE` as a codespace secret in GitHub under Settings > Codespaces > Secrets. Set the value to `1`. Any non-empty string is treated as active.

## How to Verify

Open a codespace and check whether the bootstrap ran. If the flag was set at creation time, the full pipeline will have executed. Changing the secret on a running codespace has no effect until a new one is created.

## Where It Is Used

`script/bootstrap` reads the flag once at startup. The CI workflow sets it in `.github/workflows/run-ci.yml` to exercise the complete bootstrap pipeline.
