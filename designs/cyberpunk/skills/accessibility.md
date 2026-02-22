name: cyberpunk-accessibility
description: Accessibility validation for cyberpunk design
---

## Cyberpunk Accessibility

### Contrast
- #00FF41 on #0D0D0D = 14.4:1 — exceeds AAA
- Neon glow `text-shadow` can reduce perceived contrast — keep core text sharp
- Secondary dim text: min #00CC33 on #0D0D0D = 9.1:1

### Motion Sensitivity
Glitch effects and scanlines can trigger vestibular issues.

```css
@media (prefers-reduced-motion: reduce) {
  .glitch { animation: none; }
  .scanlines { display: none; }
  .cursor-blink { animation: none; opacity: 1; }
  .glow { text-shadow: none; }
}
```

### Focus States
- `outline: 1px solid #00FF41` — matches the terminal aesthetic
- Add glow on focus: `box-shadow: 0 0 8px #00FF41`
- Remove glow in `prefers-reduced-motion`

### Screen Readers
- ASCII art tables: add `aria-label` with plain text equivalent
- Blinking cursor: `aria-hidden="true"`
