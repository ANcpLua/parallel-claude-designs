# parallel-claude-designs

16 Claude Code instances, 16 ReactBits-inspired SPA components, all running in parallel.

## How it works

1. Creates a [git worktree](https://git-scm.com/docs/git-worktree) per style
2. Injects a design-specific `CLAUDE.md` with visual rules + WCAG 2.2 AA constraints
3. Launches `claude -p` in each worktree with `&` (background)
4. Polls for completion, reports live progress
5. All 16 run simultaneously — zero coordination needed

The `Deleted branch design-*` lines on re-runs are a safety net — `git worktree add -b` fails if the branch already
exists, so the script cleans up before creating fresh worktrees.

## ReactBits Showcase (`reactbits-showcase/`)

The repo includes a React SPA with the [shadcn MCP server](https://ui.shadcn.com/docs/mcp) configured and a React Bits
Pro registry.

This means Claude can browse, search, and install React Bits components via natural language:

```bash
"Add the Dither background from React Bits"
"Show me all available backgrounds from the React Bits registry"
"Build a hero section using Aurora from React Bits with a SplitText heading"
```

### Setup

```bash
cd reactbits-showcase
npm install
npm run dev
```

The MCP server handles registry lookups and file installation.

## Component rollers

Sibling projects (`react-roller/`, `angular-roller/`, `blazor-roller/`, `sveltekit-roller/`) each pick a random
ReactBits Pro block and recreate the effect in vanilla CSS/JS for the target framework.

## Designs

Each design produces a single self-contained `index.html` (inline CSS + JS, no dependencies).

| #  | Style           | Page Type         | ReactBits Effect                             |
|----|-----------------|-------------------|----------------------------------------------|
| 1  | aurora-blur     | Hero Section      | Aurora Blur — animated gradient blobs        |
| 2  | particle-text   | About Page        | Particle Text — canvas scatter/reform        |
| 3  | liquid-morph    | Tour Gallery      | Liquid Swap — SVG displacement morph         |
| 4  | glass-flow      | Dashboard         | Glass Flow — frosted cards + glass cursor    |
| 5  | silk-waves      | Waitlist Landing  | Silk Waves — SVG ribbon waves                |
| 6  | letter-flip     | Profile Page      | 3D Letter Swap — CSS perspective flip        |
| 7  | halftone-spiral | Contact Form      | Halftone Vortex — Fermat spiral dots         |
| 8  | gradient-blob   | Pricing Page      | Gradient Blob — morphing CSS blobs           |
| 9  | shader-glow     | Features Page     | Shader Card — mouse-tracking iridescent glow |
| 10 | stagger-cascade | Blog/Articles     | Staggered Text — scroll-triggered cascade    |
| 11 | parallax-depth  | How It Works      | Parallax Cards — 3D mouse-tracking depth     |
| 12 | neon-pulse      | Navigation + Hero | Neon Reveal — glow underlines + flicker      |
| 13 | metallic-swirl  | Auth/Login        | Metallic Swirl — rotating conic gradient     |
| 14 | dot-matrix      | Stats/Metrics     | Dot Shift — LED-style canvas digits          |
| 15 | flame-trail     | Call To Action    | Flame Paths — SVG path fire trails           |
| 16 | black-hole      | 404 Error         | Black Hole — gravity sim + accretion disk    |

All designs are tour-planner themed and WCAG 2.2 AA accessible with `prefers-reduced-motion` support.

## Usage

```bash
chmod +x run-designs.sh
./run-designs.sh
```

Results land in `/tmp/design-{style}/index.html`. Logs at `/tmp/design-{style}.log`.

## Requirements

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code/overview)
- [zsh](https://www.zsh.org/)
- Any git repository (worktrees need one)
