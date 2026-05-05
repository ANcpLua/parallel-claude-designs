# Parallax Depth — How It Works Page

You are building a **tour planner "How It Works" page** where cards have mouse-tracking parallax depth with 3D
perspective.

## Visual Identity

- **Effect**: Cards tilt in 3D based on mouse position. Internal elements (icon, title, description) each have different
  `translateZ` values, creating a layered depth effect. Card surface catches a specular highlight that moves with the
  cursor.
- **Implementation**: JS `mousemove` on each card calculates tilt angles (`rotateX/Y` max 15deg). Card has
  `transform-style: preserve-3d` + `perspective: 800px` on parent. Children use `transform: translateZ(20px/40px/60px)`
  for depth layering. Specular highlight: `::after` with radial gradient follows mouse.
- **Layout**: 4 steps arranged vertically with alternating left/right alignment (zigzag), connected by a vertical
  line/timeline
- **Typography**: System sans-serif, step numbers in oversized light weight (`4rem`, weight 200), titles `1.5rem` weight
  600

## Palette

- Background: `#0d1b2a` (dark navy)
- Cards: `#1b2838` with `border: 1px solid #2d3748`
- Step numbers: `#778da9` (muted blue-gray)
- Text: `#e0e1dd` (headings), `#a0aec0` (body)
- Timeline line: `#415a77`
- Accent/specular: `rgba(119,141,169,0.3)`

## Content

- **Page title**: "How TourPlanner Works" centered, with timeline below
- **4 steps** (each a parallax card):
    1. "Choose Your Destination" — Search from 200+ regions, filter by difficulty and season
    2. "Customize Your Route" — Drop waypoints, swap any leg the route picker draws, lock the rest stops you need
    3. "Invite Your Group" — Share a link, everyone sees the plan in real-time
    4. "Hit The Trail" — Offline maps, turn-by-turn, live weather alerts
- Each card: large step number, icon (unicode), title, 2-line description
- **Bottom CTA**: "Ready to explore?" with "Start Free Trial" button
- Timeline connector: dashed vertical line with dot markers at each step

## Anti-Patterns

- No tilt beyond 15deg — subtle depth, not a funhouse mirror
- No parallax on the timeline line itself — only on cards
- No delay/lag over 100ms on tilt — must feel responsive
- No depth effect on mobile — use static cards with subtle shadow instead

## Accessibility (WCAG 2.2 AA)

- Cards are informational `<section>` elements, not interactive (unless linked)
- Steps: `<ol>` ordered list semantically, visually styled as cards
- `prefers-reduced-motion: reduce` → no tilt, static perspective, shadow-only depth
- All text: 4.5:1 contrast on card backgrounds
- CTA button: `<a>` or `<button>`, focus ring `outline: 3px solid #778da9`
- Step numbers: not purely decorative — part of the ordered content
- Timeline: `aria-hidden="true"` (decorative connector)

## Technical

- Single `index.html`, inline CSS + JS
- JS: `mousemove` and `mouseleave` (reset tilt to 0 with transition) per card
- Tilt calc: `rotateY = ((x - centerX) / halfWidth) * maxTilt` (and X axis inverse)
- CSS `transition: transform 0.1s ease-out` for smooth follow
- `will-change: transform` on cards for GPU acceleration
- Responsive: zigzag → vertical stack under 768px, parallax disabled on touch
- Touch detection: `'ontouchstart' in window` → skip tilt listeners
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
