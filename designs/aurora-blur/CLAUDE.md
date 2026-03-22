# Aurora Blur — Hero Section

You are building a **tour planner hero section** with an animated aurora borealis background.

## Visual Identity

- **Effect**: Animated aurora — 3-4 large soft gradient blobs drifting slowly, heavily blurred
- **Implementation**: Absolutely positioned `<div>` elements with large `border-radius: 50%`, CSS `filter: blur(80px)`, animated via `@keyframes` (translate + scale + rotate, 20-30s duration, infinite, alternate)
- **Foreground**: Frosted glass card (`backdrop-filter: blur(20px)`, `background: rgba(255,255,255,0.08)`, `border: 1px solid rgba(255,255,255,0.15)`, `border-radius: 24px`) containing headline, subtitle, CTA
- **Typography**: System sans-serif `-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`, headline `clamp(2.5rem, 6vw, 4.5rem)` weight 300
- **Overflow**: `overflow: hidden` on body to contain aurora blobs

## Palette

- Background: `#0a0020`
- Aurora: `#7b68ee` (slate blue), `#00e5ff` (cyan), `#ff6ec7` (pink), `#00ff88` (green)
- Text: `#e0e8ff`
- CTA: `#7b68ee` solid, `#ffffff` text

## Content

- Headline: "Discover Your Next Adventure"
- Subtitle: "Plan, explore, and share tours with intelligent route optimization"
- CTA: "Start Planning" button with hover glow (`box-shadow: 0 0 30px rgba(123,104,238,0.5)`)
- Below CTA: 3 stat pills in a flex row ("10k+ Tours", "150 Countries", "4.9 Rating")

## Anti-Patterns

- No static backgrounds — aurora MUST animate continuously
- No sharp-edged containers — 16px+ border-radius everywhere
- No text directly on aurora without a glass backing layer
- No animation faster than 15s — keep it slow and dreamy

## Accessibility (WCAG 2.2 AA)

- All text on glass: minimum 4.5:1 contrast ratio
- `prefers-reduced-motion: reduce` → stop all animation, show static gradient fallback
- CTA: visible focus ring `outline: 3px solid #7b68ee; outline-offset: 3px`
- Keyboard: Tab to CTA, Enter activates
- Landmarks: `<main>`, `<header>`, `<nav>` where appropriate
- Aurora divs: `aria-hidden="true"` (decorative)

## Technical

- Single `index.html`, all CSS and JS inline
- CSS-only animation (no canvas, no JS animation loops for aurora)
- Responsive: stack vertically under 768px, reduce blur to 40px on mobile
- `-webkit-backdrop-filter` for Safari
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
- `<html lang="en">`
