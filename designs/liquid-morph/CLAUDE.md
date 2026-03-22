# Liquid Morph — Tour Showcase Gallery

You are building a **tour showcase gallery** with liquid morphing transitions between tour cards.

## Visual Identity

- **Effect**: SVG `<feTurbulence>` + `<feDisplacementMap>` filter applied during transitions. When clicking a tour card, the current view dissolves with a liquid/water distortion before the next card morphs in.
- **Implementation**: SVG filter defined inline. Transition triggered by toggling a CSS class that animates `baseFrequency` of `<feTurbulence>` from 0 to 0.04 and back via JS (animate the attribute over ~800ms). Cards cross-fade while the filter distorts.
- **Layout**: 2-column masonry-style grid of tour cards on desktop, single column on mobile
- **Cards**: Full-bleed image with gradient overlay at bottom for text, `border-radius: 20px`, subtle shadow
- **Typography**: System sans-serif, card titles `clamp(1.2rem, 3vw, 1.8rem)` weight 600

## Palette

- Background: `#1a1a2e`
- Card gradient overlay: `linear-gradient(transparent 40%, rgba(26,26,46,0.95) 100%)`
- Accent: `#e94560` (warm red), `#0f3460` (deep blue)
- Text: `#eaeaea`
- Tags: `rgba(233,69,96,0.2)` bg with `#e94560` text

## Content

- 6 tour cards: "Alpine Peaks Trail", "Coastal Sunset Route", "Ancient Temple Walk", "Desert Oasis Trek", "Rainforest Canopy Path", "Arctic Aurora Route"
- Each card: placeholder gradient background (since no real images), location tag, difficulty badge, duration, rating
- A detail panel slides up when a card is selected (with liquid transition)

## Anti-Patterns

- No instant/hard transitions — every state change uses the liquid morph filter
- No cards without hover feedback (scale 1.02 + shadow increase)
- No grid gaps smaller than 16px
- No SVG filter without a fallback (if `feDisplacementMap` unsupported, use CSS opacity fade)

## Accessibility (WCAG 2.2 AA)

- Cards are `<button>` or `<a>` elements — fully keyboard accessible
- `prefers-reduced-motion: reduce` → disable liquid filter, use simple CSS fade
- Card text over gradient: 4.5:1 contrast ratio
- Focus ring: `outline: 3px solid #e94560; outline-offset: 2px`
- `aria-label` on each card with full tour name and details
- Grid uses `role="list"` with `role="listitem"` on cards
- Detail panel: `aria-live="polite"` for screen reader announcement

## Technical

- Single `index.html`, inline CSS + JS + SVG
- SVG filter defined once in a hidden `<svg>` at top of body
- CSS Grid for layout with `grid-template-columns: repeat(auto-fill, minmax(300px, 1fr))`
- Transition JS: requestAnimationFrame loop to animate `feTurbulence.baseFrequency.baseVal`
- Responsive: single column under 640px
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
