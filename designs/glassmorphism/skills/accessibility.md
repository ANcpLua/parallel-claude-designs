name: glassmorphism-accessibility
description: Accessibility validation for glassmorphism design
---

## Glassmorphism Accessibility

### The Core Problem
Transparent backgrounds mean contrast depends on what's behind the glass.

### Contrast Strategy
- Always test text over BOTH light and dark areas of the background gradient
- Minimum: `background: rgba(255,255,255,0.15)` + `backdrop-filter: blur(16px)`
- Add `text-shadow: 0 1px 2px rgba(0,0,0,0.3)` as safety net for white text
- If contrast fails: increase rgba alpha to 0.25-0.4

### Focus States
- `outline: 2px solid rgba(255,255,255,0.8)` with `outline-offset: 2px`
- Glow alternative: `box-shadow: 0 0 0 2px rgba(255,255,255,0.6)`

### Fallback
```css
@supports not (backdrop-filter: blur(1px)) {
  .glass { background: rgba(30, 30, 80, 0.85); }
}
```

### Motion
- `prefers-reduced-motion`: disable any shimmer/float animations
