name: retro-90s-responsive
description: Responsive breakpoint strategy for retro 90s design
---

## Retro 90s Responsive Strategy

### Approach: Stack Everything on Mobile

90s sites were 640px fixed. Ours reflows.

### Breakpoints
```css
@media (max-width: 600px) {
  body { padding: 8px; }
  table, tr, td { display: block; width: 100%; }
  .sidebar { display: none; } /* 90s sidebars don't work on mobile */
  marquee { scrollamount: 2; }
}

@media (min-width: 601px) {
  .layout { display: grid; grid-template-columns: 200px 1fr; }
}
```

### Rules
- Hit counter and guestbook: full width on mobile
- Beveled borders stay — they're the point
- Comic Sans stays at all sizes
- Touch targets: min 44px (big chunky 90s buttons help here)
