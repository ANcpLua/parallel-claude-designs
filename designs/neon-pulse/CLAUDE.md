# Neon Pulse — Navigation + Hero Hybrid

You are building a **tour planner landing page** with neon glow reveal navigation and pulsing neon accents throughout.

## Visual Identity

- **Effect**: Navigation links have neon underline that glows and expands on hover with a pulse animation. Hero text has
  a neon flicker effect (opacity oscillation via keyframes simulating a neon sign powering on). Background has subtle
  neon grid lines (perspective-transformed CSS grid) receding to a vanishing point.
- **Implementation**:
    - Nav underlines: `::after` pseudo-element, `height: 2px`, expands from `width: 0` to `100%` on hover, with
      `box-shadow: 0 0 10px currentColor, 0 0 20px currentColor`
    - Neon flicker: `@keyframes flicker` with random opacity steps (1, 0.8, 1, 0.6, 1, 0.9, 1 at various % stops)
    - Grid: CSS `linear-gradient` creating grid lines on a `<div>` with `perspective: 300px` and `rotateX(60deg)`
- **Cyberpunk-meets-luxury**: Dark with electric highlights

## Palette

- Background: `#0d0d0d`
- Neon magenta: `#ff00ff`
- Neon cyan: `#00ffff`
- Grid lines: `rgba(0,255,255,0.1)`
- Text: `#f0f0f0` (headings), `#a0a0a0` (body)
- Nav active: `#ff00ff` glow
- Buttons: transparent border `#00ffff`, glow on hover

## Content

- **Sticky navbar**: Logo "TourPlanner" in neon flicker + nav links: Explore, Features, Pricing, Contact — each with
  neon underline hover
- **Hero section**: Large headline "Light Up Your Journey" with neon text-shadow, subtitle below, two CTA buttons ("
  Explore Tours" magenta glow, "Watch Demo" cyan outline)
- **Scrolling section**: 3 feature spotlights, each with a neon icon (border circle with glow), title, description
- **Footer**: Minimal dark footer with neon-accented social links

## Anti-Patterns

- No neon on body text — only headlines, nav links, accents, icons
- No all-neon-all-the-time — contrast between glowing and dark areas is essential
- No neon flicker faster than 2s cycle — should feel electric, not epileptic
- No perspective grid that dominates — it's a subtle background texture

## Accessibility (WCAG 2.2 AA)

- Neon text-shadow does NOT count toward contrast — base text color must pass 4.5:1 alone
- `prefers-reduced-motion: reduce` → disable flicker animation, static glow, no grid animation
- Nav: `<nav aria-label="Main navigation">`, `<ul>`, `<li>`, `<a>` with `aria-current="page"`
- Focus indicators: bright visible outlines, not just glow (glow can be missed)
- Sticky nav: doesn't trap focus, `z-index` doesn't cover modal content
- Grid background: `aria-hidden="true"`
- Hero buttons: descriptive labels, keyboard accessible
- No seizure risk: flicker has no frequency above 3 per second

## Technical

- Single `index.html`, inline CSS
- CSS-only animations (no JS required except for mobile nav toggle)
- Perspective grid:
  `background-image: linear-gradient(rgba(0,255,255,0.1) 1px, transparent 1px), linear-gradient(90deg, rgba(0,255,255,0.1) 1px, transparent 1px)`,
  `background-size: 40px 40px`
- Sticky nav: `position: sticky; top: 0; z-index: 100`
- Mobile: hamburger menu toggle (small JS), nav becomes full-screen overlay
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
