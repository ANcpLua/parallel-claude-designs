name: swiss-typography-accessibility
description: Accessibility validation for Swiss typography design
---

## Swiss Typography Accessibility

### Contrast
- #000000 on #FFFFFF = 21:1 — perfect
- #FF0000 on #FFFFFF = 3.99:1 — use only for large text (24px+) or decorative elements
- #FF0000 on #000000 = 5.25:1 — acceptable for accent headings

### Typography as Accessibility
Swiss design's strict hierarchy IS accessible by nature:
- Size difference between levels: min 1.25x ratio
- Weight difference: 400 vs 700, never 400 vs 500 (too subtle)
- Line-height 1.5+ for body text — already a WCAG recommendation

### Focus States
- `outline: 2px solid #000000` — clean, matches the aesthetic
- `outline-offset: 4px` — generous, lets the grid breathe

### Layout
- Left-aligned text is easier to read for dyslexic users
- Flush-left, ragged-right is the most accessible text alignment
- Swiss design gets this right by default
