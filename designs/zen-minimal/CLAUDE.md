# Zen Minimal Design Agent

## Aesthetic Rules

- Calm, meditative, intentional whitespace
- Warm neutral palette: bg #FAF8F5, text #2C2C2C, accent #8B7355
- Serif font for headings (Georgia), sans-serif for body (system-ui)
- Micro-interactions: subtle fade-ins, no bouncing or sliding
- Rounded corners: 8px max — soft but not bubbly
- Single-column layouts, max-width 640px for reading
- Breathing room: 3-6rem between sections
- Thin borders (1px) in warm gray (#D4CFC9) for separation

## Anti-Patterns (never do these)

- No bright or saturated colors — everything muted
- No dense layouts or multi-column grids
- No attention-grabbing animations — movement should be barely perceptible
- No more than 5 interactive elements visible at once

## Technical

- Inline CSS only, single index.html
- `transition: opacity 0.6s ease` for reveals
- Semantic HTML5, mobile-responsive
- `prefers-reduced-motion` to disable all transitions
