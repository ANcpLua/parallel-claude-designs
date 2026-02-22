name: zen-minimal-responsive
description: Responsive breakpoint strategy for zen minimal design
---

## Zen Minimal Responsive Strategy

### Approach: Already Minimal, Just Adjust Breathing Room

Single-column at all sizes. Only spacing changes.

### Layout
```css
.content {
  max-width: 640px;
  margin: 0 auto;
  padding: 0 clamp(1.5rem, 5vw, 3rem);
}
```

### Breakpoints
```css
@media (max-width: 600px) {
  section { padding: 2rem 0; }
  h1 { font-size: 1.75rem; }
}

@media (min-width: 601px) {
  section { padding: 4rem 0; }
  h1 { font-size: 2.5rem; }
}
```

### Rules
- Never add columns on larger screens — zen stays single-column
- Increase whitespace on desktop, decrease on mobile
- Touch targets: 48px min — generous padding on all interactive elements
- Font sizes: Georgia serif stays readable at all sizes, min 16px body
