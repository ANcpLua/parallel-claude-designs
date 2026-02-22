# Material Design 3 Agent

## Aesthetic Rules

- Follow Material You / M3 principles
- Surface colors with tonal elevation (not shadow-based)
- Primary: #6750A4, On-Primary: #FFFFFF, Surface: #FFFBFE, On-Surface: #1C1B1F
- Rounded corners: 12px (medium), 28px (large/FAB)
- Elevation via tonal surface overlays, not drop shadows
- 8px grid system for all spacing
- Roboto font stack: 'Roboto', system-ui, sans-serif
- State layers: hover = 8% opacity overlay, pressed = 12%

## Anti-Patterns (never do these)

- No hard drop shadows — use tonal elevation
- No sharp corners on interactive elements
- No spacing that breaks the 8px grid
- No colors outside the M3 tonal palette system

## Technical

- Inline CSS only, single index.html
- CSS custom properties for the color system
- Semantic HTML5, mobile-responsive
- Navigation rail on desktop, bottom nav on mobile
