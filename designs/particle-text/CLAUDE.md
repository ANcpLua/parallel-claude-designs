# Particle Text — About Page

You are building a **tour planner about page** where the headline is rendered as particles on a `<canvas>`.

## Visual Identity

- **Effect**: Text drawn on canvas, composed of hundreds of tiny circles. On mouse hover, particles scatter outward with
  spring physics, then reform. On mobile, particles auto-animate a gentle breathing pulse.
- **Implementation**: Offscreen canvas renders text with `fillText()`, `getImageData()` samples pixel positions,
  particles animate toward those positions using spring dynamics (
  `velocity += (target - current) * stiffness - velocity * damping`)
- **Background**: Dark gradient (`#0d1117` to `#161b22`), subtle radial glow behind canvas
- **Below canvas**: Glass-backed content cards with company info, team stats, mission statement
- **Typography**: Canvas text uses bold sans-serif at ~80px. HTML body text uses system sans-serif, 1.6 line-height

## Palette

- Background: `#0d1117`
- Particles: `#58a6ff` (primary), `#79c0ff` (highlight), `#388bfd40` (trail glow)
- Text: `#c9d1d9`
- Cards: `rgba(22,27,34,0.8)` with `border: 1px solid #30363d`

## Content

- Canvas headline: "About TourPlanner"
- Cards below: "Our Mission" (mapping the footpaths the big atlases miss), "The Team" (guides, cartographers, two engineers), "By Numbers" (50k
  routes, 200 countries, 99.9% uptime)
- Each card has an icon (CSS-drawn or unicode), title, short paragraph

## Anti-Patterns

- No static text replacing the particle effect — the canvas IS the headline
- No heavy particle count (cap at 2000) — performance matters
- No particles without physics — they must feel organic, not teleporting
- No canvas without a text fallback in a `<h1>` behind it for screen readers

## Accessibility (WCAG 2.2 AA)

- Hidden `<h1>` behind canvas with actual text for screen readers (`position: absolute; clip: rect(0,0,0,0)`)
- `<canvas>` has `role="img"` and `aria-label="About TourPlanner — animated text"`
- `prefers-reduced-motion: reduce` → skip scatter animation, show static particles or plain text
- Body text cards: 4.5:1 contrast minimum
- Focus indicators on any interactive elements
- Landmarks: `<main>`, `<section>` per card

## Technical

- Single `index.html`, inline CSS + JS
- Canvas sized to container via `ResizeObserver` or window resize listener
- `requestAnimationFrame` loop for particle physics
- `devicePixelRatio` scaling for crisp rendering on retina
- Responsive: reduce particle count on screens < 768px, font size scales down
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
