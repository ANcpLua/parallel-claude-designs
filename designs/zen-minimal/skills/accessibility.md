name: zen-minimal-accessibility
description: Accessibility validation for zen minimal design
---

## Zen Minimal Accessibility

### Contrast
- #2C2C2C on #FAF8F5 = 12.5:1 — exceeds AAA
- #8B7355 on #FAF8F5 = 4.2:1 — borderline for small text, use for large text/icons only
- For small accent text: darken to #6B5840 = 6.1:1
- Border #D4CFC9 on #FAF8F5 = 1.6:1 — fine for decorative borders, not for conveying info

### Motion
Zen animations should be barely perceptible — but still respect the preference.

```css
@media (prefers-reduced-motion: reduce) {
  * { transition: none !important; animation: none !important; }
}
```

### Focus States
- `outline: 2px solid #8B7355` with `outline-offset: 4px`
- Warm, soft, matches the palette

### Cognitive Load
- Max 5 interactive elements visible at once — this IS accessibility
- Single-column layout reduces scanning effort
- Generous whitespace between targets prevents mis-taps
