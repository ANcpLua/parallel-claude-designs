name: swiss-typography-responsive
description: Responsive breakpoint strategy for Swiss typography design
---

## Swiss Typography Responsive Strategy

### Approach: Grid Collapses Mathematically

### Grid System
```css
.grid {
  display: grid;
  gap: 1.5rem;
}

@media (max-width: 600px) {
  .grid { grid-template-columns: repeat(2, 1fr); }
}

@media (min-width: 601px) and (max-width: 1024px) {
  .grid { grid-template-columns: repeat(6, 1fr); }
}

@media (min-width: 1025px) {
  .grid { grid-template-columns: repeat(12, 1fr); }
}
```

### Typography Scale (Modular)
```css
:root {
  --step-0: clamp(1rem, 1.5vw, 1.125rem);
  --step-1: clamp(1.25rem, 2vw, 1.5rem);
  --step-2: clamp(1.5rem, 3vw, 2rem);
  --step-3: clamp(2rem, 4vw, 3rem);
}
```

### Rules
- Left-alignment at all sizes — never center on mobile
- Mathematical spacing scale preserved: 1rem, 1.5rem, 2rem, 3rem, 4.5rem
- 2-column minimum even on mobile (Swiss grids don't go single-column)
