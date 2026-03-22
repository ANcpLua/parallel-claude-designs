# Flame Trail — Call To Action Section

You are building a **tour planner CTA/conversion page** with animated flame/fire path trails along SVG paths.

## Visual Identity

- **Effect**: SVG paths define flowing curves across the page. Particles travel along these paths, leaving a glowing trail that fades — creating a flame/fire-trail aesthetic. The particles emit from the CTA button area and flow outward, drawing the eye inward.
- **Implementation**: Define 3-4 `<path>` elements in SVG. JS calculates points along each path using `getPointAtLength()`. Particles are small circles that move along the path, drawn on a canvas overlay. Each particle has a short trail (store last 10 positions, draw with decreasing opacity and size).
- **Layout**: Full-viewport centered CTA section with large headline, supporting text, and a prominent CTA button. SVG/canvas trails wrap around the content.
- **Typography**: System sans-serif, headline `clamp(2rem, 5vw, 3.5rem)` weight 700, body weight 400

## Palette

- Background: `#1a0a00` (very dark warm brown)
- Flame core: `#ffffff` (center) → `#ffd700` (mid) → `#ff8c00` (outer) → `#ff4500` (edge) → transparent
- Trail glow: `rgba(255,140,0,0.3)` halo
- Text: `#fff4e6` (warm white)
- CTA button: `linear-gradient(135deg, #ff4500, #ff8c00)`, white text
- Supporting text: `#d4a574`

## Content

- **Headline**: "Your Adventure Starts Now"
- **Subtext**: "Join 50,000+ explorers who plan smarter, travel farther, and discover more"
- **CTA button**: "Start Your Free Trial" — large, 56px height, 24px horizontal padding, `border-radius: 12px`
- **Below CTA**: "No credit card required · 14-day free trial · Cancel anytime"
- **Trust logos row**: 5 placeholder brand rectangles ("Featured in...") with low opacity

## Anti-Patterns

- No flame particles without trails — isolated dots ruin the fire effect
- No trail colors outside the warm spectrum — strictly orange/gold/red/white
- No canvas/SVG overlapping clickable elements — `pointer-events: none` on overlay
- No particle count above 200 — performance > visual density

## Accessibility (WCAG 2.2 AA)

- Canvas/SVG overlay: `aria-hidden="true"`, `pointer-events: none`
- CTA button: `<a>` or `<button>`, massive focus ring (`outline: 4px solid #ff8c00; outline-offset: 4px`)
- `prefers-reduced-motion: reduce` → static gradient glow around CTA instead of animated trails
- Text contrast: `#fff4e6` on `#1a0a00` = 15:1 (excellent)
- Trust section: if logos are images, provide `alt` text
- Landmarks: `<main>`, `<section aria-label="Call to action">`
- Button text is self-descriptive (not just "Click here")

## Technical

- Single `index.html`, inline CSS + JS
- Hidden `<svg>` with `<path>` definitions for trail routes
- `<canvas>` overlay: positioned absolute, full viewport, `pointer-events: none`
- JS: `requestAnimationFrame` loop, particles advance along path via `getPointAtLength(offset)`
- Trail: store particle position history (10 frames), draw as polyline with fading opacity
- Particle spawning: emit 2-3 particles per frame from path start
- Responsive: fewer paths on mobile (2 instead of 4), reduced particle count
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
