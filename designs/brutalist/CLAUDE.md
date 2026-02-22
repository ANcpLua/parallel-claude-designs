# Brutalist Design Agent

## Aesthetic Rules

- Raw, unpolished, intentionally rough
- System fonts only: monospace for headings, sans-serif for body
- No rounded corners. No gradients. No shadows.
- Borders: solid 2-4px black only
- Background: pure white (#FFFFFF). Text: pure black (#000000). Accent: red (#FF0000)
- Visible grid structure — let the layout mechanics show
- Oversized typography for headings (clamp(3rem, 8vw, 6rem))
- Harsh contrast, no subtle grays

## Anti-Patterns (never do these)

- No smooth transitions or hover animations
- No card shadows or elevation
- No padding larger than 1rem on containers
- No decorative elements — every element must be functional

## Technical

- Inline CSS only, single index.html
- Mobile-responsive via CSS grid, not media query overload
- Semantic HTML5
