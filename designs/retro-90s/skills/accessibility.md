name: retro-90s-accessibility
description: Accessibility validation for retro 90s design
---

## Retro 90s Accessibility

### The Tension
90s aesthetics are inherently hostile to accessibility. Bridge the gap.

### Contrast
- Cyan (#00FFFF) bg + black text = 16.7:1 — good
- Magenta (#FF00FF) on cyan = 2.6:1 — FAILS. Use magenta only on black/dark bg
- Yellow (#FFFF00) on white = 1.07:1 — NEVER as text. Decorative only.
- Yellow on black = 19.6:1 — safe for highlights

### Marquee
```html
<!-- Accessible marquee: visible but pausable -->
<marquee behavior="scroll" scrollamount="3" aria-live="polite">
  <span>Welcome to my page!</span>
</marquee>
```
- Keep `scrollamount` low (2-4)
- Content must be readable when static

### Motion
- `prefers-reduced-motion`: stop ALL marquees, blinking text
```css
@media (prefers-reduced-motion: reduce) {
  marquee { -moz-binding: none; overflow: visible; }
  .blink { animation: none; }
}
```
