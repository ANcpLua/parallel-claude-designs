name: brutalist-responsive
description: Responsive breakpoint strategy for brutalist design
---

## Brutalist Responsive Strategy

### Approach: Content-Out, Not Device-In

Brutalist design uses CSS Grid that naturally reflows. Minimal breakpoints.

### Breakpoints
```css
/* Single column */
@media (max-width: 600px) {
  .grid { grid-template-columns: 1fr; }
}

/* Multi column — grid decides */
@media (min-width: 601px) {
  .grid { grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); }
}
```

### Typography Scaling
```css
h1 { font-size: clamp(2rem, 8vw, 6rem); }
body { font-size: clamp(1rem, 2vw, 1.25rem); }
```

### Rules
- No hamburger menus — stack nav links vertically on mobile
- No hidden content — everything visible at every size
- Touch targets: min 44x44px
