name: glassmorphism-responsive
description: Responsive breakpoint strategy for glassmorphism design
---

## Glassmorphism Responsive Strategy

### Approach: Cards Reflow, Glass Stays

### Breakpoints
```css
@media (max-width: 600px) {
  .card-grid { grid-template-columns: 1fr; }
  .glass-card { backdrop-filter: blur(12px); } /* lighter blur for performance */
}

@media (min-width: 601px) and (max-width: 1024px) {
  .card-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (min-width: 1025px) {
  .card-grid { grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); }
}
```

### Mobile Performance
- Reduce `blur()` value on mobile (16px -> 10px) — GPU intensive
- Fewer glass layers stacked — max 2 overlapping on mobile
- Touch targets: min 48px with glass padding helping
