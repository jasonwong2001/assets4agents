## Security policy

### Reporting

If you discover a security issue, please avoid opening a public issue with sensitive details. Prefer a private report to the repo owner.

### Secrets handling

This repository should **never** contain real secrets (API keys, tokens, credentials).

- Keep secrets in local-only files (ignored by git) or in a secret manager.
- Use environment variables for runtime configuration.

### Publishing checklist (important)

If a secret was ever committed to git history (even if later removed), assume it is compromised.

1. **Rotate the secret** at the provider (API platform, GitHub, etc.).
2. **Remove it from git history** before making the repo public.

#### Removing a file from history (example)

If you previously committed a secrets file, remove it from all commits using `git filter-repo`:

```bash
# run from the repo root
git filter-repo --path path/to/secrets-file --invert-paths
```

Then force-push the rewritten history to your remote (only after you’re sure this is what you want):

```bash
git push --force --all
git push --force --tags
```

If the repo was already public, also assume the secret was harvested.
