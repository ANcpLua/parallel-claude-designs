# parallel-claude-designs

8 Claude Code instances, 8 design aesthetics, 1 bash loop. Each instance gets its own git worktree and builds a different landing page in parallel.

This is a demo showing how to run multiple Claude Code instances simultaneously using [git worktrees](https://git-scm.com/docs/git-worktree) for isolation.

![Demo](https://github.com/user-attachments/assets/bfa12fb3-da27-4944-bcf6-985fb7731560)

## Styles

| Style | Task |
|-------|------|
| brutalist | Developer portfolio |
| glassmorphism | Weather dashboard |
| apple-clean | Product launch page |
| retro-90s | Personal homepage |
| material3 | Admin dashboard |
| cyberpunk | Crypto trading terminal |
| swiss-typography | Design agency landing page |
| zen-minimal | Meditation app onboarding |

## Usage

```bash
chmod +x run-designs.sh
./run-designs.sh
```

Results land in `/tmp/design-{style}/index.html`. Logs at `/tmp/design-{style}.log`.

## How it works

1. Creates a [git worktree](https://git-scm.com/docs/git-worktree) per style
2. Launches `claude -p` in each worktree with `&` (background)
3. Polls for completion, reports live progress
4. All 8 run simultaneously — zero coordination needed

The `Deleted branch design-*` lines you see on re-runs are a safety net — `git worktree add -b` fails if the branch already exists from a previous run, so the script cleans up before creating fresh worktrees.

## Requirements

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code/overview)
- zsh
- Any git repository (worktrees need one)
