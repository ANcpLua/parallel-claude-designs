# Silk Waves — Waitlist Landing Page

You are building a **tour planner waitlist/landing page** with smooth animated silk ribbon waves.

## Visual Identity

- **Effect**: Multiple layered SVG wave paths that animate continuously, creating a flowing silk/ribbon feel. 3-4 wave layers at different speeds and opacities stacked at the bottom third of the page.
- **Implementation**: SVG `<path>` elements with cubic bezier curves. Animate the `d` attribute via JS (interpolate between two path states) or use CSS `@keyframes` on `transform: translateX()` with duplicated paths for seamless looping.
- **Layout**: Full-viewport hero with centered content above waves, clean and spacious
- **Typography**: Elegant serif for headlines (`Georgia, 'Times New Roman', serif`), sans-serif for body. Headline `clamp(2.8rem, 7vw, 5rem)` weight 300 with generous letter-spacing
- **Warm, premium feel**: Like a luxury travel brand

## Palette

- Background: `#faf9f6` (warm off-white)
- Wave colors: `#b8860b` (dark goldenrod, 0.3 opacity), `#8b4513` (saddle brown, 0.2), `#d4a574` (tan, 0.15)
- Text: `#2d2d2d` (headlines), `#5a5a5a` (body)
- CTA button: `#8b4513` bg, `#faf9f6` text
- Input field: `#ffffff` bg, `1px solid #d4a574`

## Content

- Small top logo text: "TourPlanner" in small caps
- Headline: "Curated Journeys, Crafted For You"
- Subtitle: "Join the waitlist for early access to AI-powered tour planning"
- Email input + "Join Waitlist" button in a single row
- Below: "2,847 travelers already waiting" with small avatar stack (5 colored circles overlapping)
- At very bottom (above waves): 3 feature icons in a row — "Smart Routes", "Local Guides", "Group Sync"

## Anti-Patterns

- No harsh colors — everything warm and muted
- No blocky layouts — generous whitespace, breathing room
- No wave animation faster than 8s per cycle
- No serif font on buttons or small text — serif for headlines only

## Accessibility (WCAG 2.2 AA)

- Text contrast: `#2d2d2d` on `#faf9f6` = 10.5:1 (excellent)
- Email input: visible `<label>` (can be visually adjacent), `autocomplete="email"`, `type="email"`
- Form: `<form>` with `aria-label="Waitlist signup"`
- Waves: `aria-hidden="true"` (decorative)
- `prefers-reduced-motion: reduce` → static wave paths, no animation
- CTA focus: `outline: 3px solid #8b4513; outline-offset: 3px`
- Skip link at top for keyboard users

## Technical

- Single `index.html`, inline CSS + JS + SVG
- SVG waves positioned absolutely at bottom of viewport
- CSS `min-height: 100vh` on hero section
- JS animation: `requestAnimationFrame` loop morphing SVG path control points
- Responsive: waves scale with viewport, content stacks under 640px
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="light">`
