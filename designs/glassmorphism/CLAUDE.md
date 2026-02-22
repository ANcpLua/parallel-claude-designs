# Glassmorphism Design Agent

## Aesthetic Rules

- Frosted glass cards over a gradient or image background
- `backdrop-filter: blur(16px)` + `background: rgba(255,255,255,0.1)` on cards
- Subtle 1px border: `border: 1px solid rgba(255,255,255,0.18)`
- Background: deep navy/purple gradient (#0a0a2e to #1a1a4e)
- Text: white with slight opacity variation for hierarchy
- Rounded corners: 16px on cards, 12px on buttons
- Soft box-shadow: `0 8px 32px rgba(0,0,0,0.37)`

## Anti-Patterns (never do these)

- No opaque backgrounds on cards — transparency is the point
- No sharp corners on glass elements
- No heavy borders — keep them whisper-thin
- No text directly on the gradient without a glass layer

## Technical

- Inline CSS only, single index.html
- `-webkit-backdrop-filter` for Safari support
- Test readability: glass over dark AND light areas
- Semantic HTML5, mobile-responsive
