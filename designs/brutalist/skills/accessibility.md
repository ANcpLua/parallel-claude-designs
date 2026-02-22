name: brutalist-accessibility
description: Accessibility validation for brutalist design
---

## Brutalist Accessibility

### Contrast
- Black on white = 21:1 ratio — always passes WCAG AAA
- Red (#FF0000) on white = 3.99:1 — use ONLY for decorative elements, never body text
- Red on black = 5.25:1 — acceptable for headings (AA Large)

### Focus States
- Use `outline: 3px solid #FF0000` — no outline-offset, keep it raw
- Never `outline: none` — brutalist embraces visible mechanics

### Motion
- No animations exist to worry about — brutalist is static by nature
- If adding hover states: color swap only, no transitions

### Semantic Structure
- One `<h1>` per page
- Section headings in strict order (h2 > h3 > h4)
- All images need `alt` text — describe function, not decoration
