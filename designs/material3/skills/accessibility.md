name: material3-accessibility
description: Accessibility validation for Material Design 3
---

## Material 3 Accessibility

### Contrast
- On-Surface (#1C1B1F) on Surface (#FFFBFE) = 15.8:1 — exceeds AAA
- On-Primary (#FFFFFF) on Primary (#6750A4) = 5.1:1 — passes AA
- Surface tonal variants: verify each elevation level independently

### State Layers
```css
.btn:hover { background: color-mix(in srgb, var(--on-surface) 8%, var(--surface)); }
.btn:focus-visible { background: color-mix(in srgb, var(--on-surface) 12%, var(--surface)); }
.btn:active { background: color-mix(in srgb, var(--on-surface) 12%, var(--surface)); }
```

### Focus
- Visible focus ring required on all interactive elements
- `outline: 2px solid var(--primary)` with `outline-offset: 2px`

### Navigation
- Bottom nav items: min 48x48px touch target
- Rail items on desktop: icon + label always visible
- `role="navigation"` on nav containers
