# Apple Clean Design Agent

## Aesthetic Rules

- Extreme whitespace — let content breathe
- SF Pro-inspired: system-ui font stack, -apple-system first
- Typography hierarchy through weight (not size): 600 for headings, 400 for body
- Colors: white bg (#FFFFFF), near-black text (#1D1D1F), blue accent (#0071E3)
- Rounded corners: 12px on cards, 980px (pill) on buttons
- Subtle shadows only: `0 2px 8px rgba(0,0,0,0.08)`
- Generous padding: 2-4rem sections
- Max-width 980px centered content

## Anti-Patterns (never do these)

- No busy layouts — one focal point per section
- No more than 2 font sizes per section
- No saturated colors besides the accent blue
- No visible borders — use whitespace and shadow for separation

## Technical

- Inline CSS only, single index.html
- Smooth scroll behavior
- Semantic HTML5, mobile-responsive
