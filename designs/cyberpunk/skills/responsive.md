name: cyberpunk-responsive
description: Responsive breakpoint strategy for cyberpunk design
---

## Cyberpunk Responsive Strategy

### Approach: Dense Terminal Reflow

Terminals adapt to width naturally. Lean into that.

### Breakpoints
```css
@media (max-width: 600px) {
  body { font-size: 12px; padding: 8px; }
  .terminal-grid { grid-template-columns: 1fr; }
  .scanlines { display: none; } /* save GPU */
  pre { overflow-x: auto; white-space: pre; }
}

@media (min-width: 601px) {
  .terminal-grid { grid-template-columns: 1fr 1fr; }
  body { font-size: 14px; padding: 16px; }
}
```

### Rules
- Monospace text wraps poorly — use `overflow-x: auto` on data blocks
- Scanlines: disable on mobile (performance)
- Glitch effects: disable on mobile (battery + motion)
- Touch targets: 44px min, use padding on terminal links
