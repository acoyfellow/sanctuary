# Sanctuary Ralph Loop

Purpose: keep Ralph runs predictable, legal, and small.

## Loop shape
- Read `scripts/ralph/prd.json` for the next `todo` story.
- Work in one story per iteration; keep diffs tiny.
- Update `scripts/ralph/progress.txt` with the story ID and result.
- Run `scripts/ralph/guard.sh` before any commit or push.
- Record outcomes in `scripts/ralph/failure.json` to pause after repeated errors.

## Guardrails
- No Diablo 2 / D2R assets, installers, ROMs, MPQs, or hashes. User supplies their own files only.
- Do not add dependencies on the first scaffold pass.
- Keep automation readable; prefer shell + Python shipped with the runner.
- Only push when the diff guard passes.
- Avoid editing `.gitignore`, CI secrets, or non-Ralph infra.

## Workflow cues
- Workflow only auto-runs on bot pushes; humans trigger via `workflow_dispatch`.
- Use `secrets.RALPH_PAT` for checkout/push.
- If `consecutive_failures >= MAX_FAILURE_RETRIES`, stop and wait for human review.

## File hints
- PRD: `scripts/ralph/prd.json`
- Constraints: `scripts/ralph/constraints.json`
- Failure log: `scripts/ralph/failure.json`
- Progress log: `scripts/ralph/progress.txt`
- Loop config: `.opencode/opencode.json`
- Execution docs: `README.md`, `content/x-thread.md`, `content/LEGAL.md`

## Success checks
- CI exists and can run a single iteration.
- PRD keeps at least three Sanctuary-specific `todo` stories.
- README tells humans how to run the Ralph loop safely.
