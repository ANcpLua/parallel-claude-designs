# Black Hole — 404 Error Page

You are building a **tour planner 404 page** with a black hole gravitational pull animation at the center.

## Visual Identity

- **Effect**: A central black circle with an animated accretion disk (rotating gradient ring) and gravitational lensing effect. Stars (small dots) around the page slowly drift toward the center, accelerating as they approach. The "404" text orbits at the edge of the accretion disk.
- **Implementation**:
  - Accretion disk: `conic-gradient` ring (donut shape via `border-radius: 50%` + inner transparent circle), animated with CSS `@keyframes rotate` (8s, linear, infinite)
  - Stars: `<canvas>` with ~100 small white dots. Each star has a velocity vector pulling toward center (`attraction = G / distance^2`), wraps around when consumed by center. Draw with slight trails.
  - "404": Positioned on the accretion disk ring, CSS `@keyframes orbit` rotating around the center
  - Gravitational lens: `filter: url(#distort)` SVG displacement filter on background near center
- **Central void**: Pure black circle, `box-shadow: 0 0 80px 40px rgba(0,0,0,0.8)` for depth
- **Typography**: System sans-serif, "404" at `clamp(4rem, 10vw, 8rem)` weight 100

## Palette

- Background: `#000000` (true black)
- Stars: `#ffffff` at varying opacity (0.3-1.0)
- Accretion disk: `conic-gradient(#6600ff, #ff0044, #ffd700, #00ffcc, #6600ff)` — full spectrum
- "404" text: `#ffffff` with glow `text-shadow: 0 0 20px rgba(255,255,255,0.5)`
- Body text: `#8888aa` (muted)
- CTA link: `#00ffcc` (teal from accretion)

## Content

- **Central animation**: Black hole + accretion disk + orbiting "404"
- **Below center**: "Lost in Space" subtitle
- **Description**: "The trail you're looking for has drifted beyond our event horizon"
- **CTA**: "Return to Base Camp" link/button
- **Easter egg**: Small text at very bottom — "Even the best explorers take a wrong turn" in dim text

## Anti-Patterns

- No static black hole — the disk MUST rotate, stars MUST drift
- No accretion disk without color variation — it needs the full spectrum
- No stars moving in straight lines — they must curve toward center (gravity sim)
- No "404" that doesn't orbit — it's part of the effect

## Accessibility (WCAG 2.2 AA)

- Canvas + accretion disk: `aria-hidden="true"` (decorative)
- "404" has a hidden duplicate `<h1>` for screen readers: "Error 404 — Page Not Found"
- `prefers-reduced-motion: reduce` → stop all animation, show static composition
- "Return to Base Camp" link: visible focus ring, descriptive label
- Text contrast: `#8888aa` on `#000000` = 5.3:1 (passes AA)
- Page must be functional without JS — static 404 content is visible
- `<main>` landmark, proper heading structure

## Technical

- Single `index.html`, inline CSS + JS
- `<canvas>` full viewport for stars, `pointer-events: none`
- Accretion disk: CSS-only rotating donut shape (element with `border-radius: 50%`, inner `mask: radial-gradient(circle, transparent 40%, black 41%)`)
- Star physics: `requestAnimationFrame`, gravitational formula per star
- Star recycling: when distance < 20px from center, respawn at random edge position
- "404" orbit: CSS `@keyframes orbit { from { transform: rotate(0deg) translateX(150px) rotate(0deg); } to { transform: rotate(360deg) translateX(150px) rotate(-360deg); } }`
- Responsive: reduce star count on mobile, accretion disk scales with viewport
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
