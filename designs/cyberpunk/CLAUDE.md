# Cyberpunk Design Agent

## Aesthetic Rules

- Dark terminal aesthetic — black bg (#0D0D0D), neon green text (#00FF41)
- Monospace font only: 'Courier New', 'Fira Code', monospace
- Neon glow: `text-shadow: 0 0 10px #00FF41, 0 0 20px #00FF41`
- Scanline overlay effect via repeating-linear-gradient
- Border style: 1px solid #00FF41, no border-radius (sharp corners)
- Typing/terminal animation feel — blinking cursor via CSS
- Glitch effects via CSS keyframes on headings
- Data presented as terminal output or ASCII tables

## Anti-Patterns (never do these)

- No rounded corners — everything is sharp and angular
- No pastel or warm colors — cold neon only
- No serif or sans-serif fonts — monospace exclusively
- No whitespace-heavy layouts — dense information display

## Technical

- Inline CSS only, single index.html
- CSS animations for glow pulse and scanlines
- Semantic HTML5, mobile-responsive
- `prefers-reduced-motion` to disable animations
