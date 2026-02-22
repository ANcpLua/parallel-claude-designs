name: apple-clean-responsive
description: Responsive breakpoint strategy for Apple clean design
---

## Apple Clean Responsive Strategy

### Approach: Centered Container, Fluid Within

### Layout
```css
.container {
  max-width: 980px;
  margin: 0 auto;
  padding: 0 clamp(1rem, 4vw, 2rem);
}
```

### Breakpoints
```css
@media (max-width: 734px) { /* iPhone */ }
@media (min-width: 735px) and (max-width: 1068px) { /* iPad */ }
@media (min-width: 1069px) { /* Desktop */ }
```

### Typography
```css
h1 { font-size: clamp(2rem, 5vw, 3.5rem); font-weight: 600; }
p { font-size: clamp(1rem, 2vw, 1.25rem); font-weight: 400; }
```

### Rules
- Single column on mobile, always
- Hero images scale to 100% width on mobile
- Remove horizontal padding from full-bleed sections on mobile
