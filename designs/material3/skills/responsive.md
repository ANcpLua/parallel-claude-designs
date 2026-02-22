name: material3-responsive
description: Responsive breakpoint strategy for Material Design 3
---

## Material 3 Responsive Strategy

### Approach: Adaptive Layout (M3 Canonical)

### Window Size Classes
```css
/* Compact (phone) */
@media (max-width: 599px) {
  .nav-rail { display: none; }
  .bottom-nav { display: flex; }
  .content { padding: 16px; }
}

/* Medium (tablet) */
@media (min-width: 600px) and (max-width: 839px) {
  .nav-rail { display: flex; width: 80px; }
  .bottom-nav { display: none; }
  .content { padding: 24px; }
}

/* Expanded (desktop) */
@media (min-width: 840px) {
  .nav-rail { display: flex; width: 80px; }
  .content { padding: 24px; max-width: 1040px; }
}
```

### Rules
- Navigation rail -> bottom nav on compact
- Data tables -> card list on compact
- All spacing in 8px increments
- FAB: bottom-right on all sizes, 56px on compact, 96px (extended) on expanded
