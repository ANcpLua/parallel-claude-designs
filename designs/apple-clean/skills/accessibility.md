name: apple-clean-accessibility
description: Accessibility validation for Apple clean design
---

## Apple Clean Accessibility

### Contrast
- #1D1D1F on #FFFFFF = 17.4:1 — exceeds AAA
- #0071E3 on #FFFFFF = 4.5:1 — passes AA, borderline for small text
- For small text links: use #0060C0 (darker blue) = 5.6:1

### Focus States
- `outline: 2px solid #0071E3` with `outline-offset: 4px`
- Round focus ring to match button shape: `border-radius: inherit`

### Touch Targets
- Minimum 44x44px — Apple's own HIG standard
- Pill buttons: min-height 48px, padding 0 24px

### Motion
- Smooth scroll: respect `prefers-reduced-motion`
```css
@media (prefers-reduced-motion: reduce) {
  html { scroll-behavior: auto; }
}
```
