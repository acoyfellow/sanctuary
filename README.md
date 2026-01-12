# Sanctuary

Public demonstration of a Ralph Loop (iterative AI task execution) anchored to an X thread.

> Thread placeholder: https://x.com/example/status/thread-id

## What is here

- `scripts/ralph/prd.json` — tiny PRD that drives each loop iteration.
- `scripts/ralph/guard.sh` — diff guard to keep changes small and legal.
- `scripts/ralph/failure.json` — tracks consecutive failures so the loop pauses safely.
- `content/x-thread.md` — captures the Grok/X thread context.
- `content/LEGAL.md` — legal boundaries; users supply their own Diablo 2 / D2R assets.

## Running the Ralph Loop

1. Trigger manually via **Actions → Ralph Loop → Run workflow** (workflow_dispatch).
2. Auto-runs on push events **only when the actor is a bot**; humans use manual dispatch.
3. The workflow uses `secrets.RALPH_PAT` for checkout/push and enforces `scripts/ralph/guard.sh` before committing changes.
4. Progress is appended to `scripts/ralph/progress.txt`; failures are counted in `scripts/ralph/failure.json` and paused when they hit `MAX_FAILURE_RETRIES`.

## Scope and safety

- One story per iteration; keep diffs small.
- No new dependencies in this scaffold pass.
- Never add or distribute Diablo 2 / D2R assets; users must provide their own files.
