# AGENTS.md — ssmscripts

Context for AI coding agents (Claude Code, Codex, opencode, Cursor, …) working in this repo.

## What this is
Small collection of Windows PowerShell scripts meant to be run on EC2 instances via
**AWS Systems Manager (SSM)**. Parked/unmaintained — one script, last changed 2023-02.

## Layout
- `iisdeletelogs.ps1` — deletes IIS log files under `C:\inetpub\logs\LogFiles` whose
  `LastWriteTime` is older than 7 days.

## Commands
No build/test/lint tooling — these are standalone scripts. To exercise one locally:
`pwsh ./iisdeletelogs.ps1` (PowerShell 5.1+; needs write permission under `C:\inetpub`).

## Conventions
- One `.ps1` per task; no wrapper or module structure.
- Feature branch → PR; never push to `master` directly.
- Scripts may execute as SYSTEM via SSM, so write them idempotent and defensive.

## Gotchas
- `iisdeletelogs.ps1` calls `Remove-Item` with no `-WhatIf` and no logging — it will happily act
  on whatever `$Path` is set to. Test against a copy before wiring it to a schedule.
