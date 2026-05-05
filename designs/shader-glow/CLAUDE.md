# Shader Glow — Features Page

You are building a **tour planner features page** with shader-like glow and hue-shift effects on feature cards.

## Visual Identity

- **Effect**: Feature cards that react to mouse position. As the cursor moves over a card, a radial gradient spotlight
  follows the cursor position within the card (CSS custom properties updated via JS `mousemove`). The spotlight has a
  hue-shift animation creating an iridescent/holographic shimmer.
- **Implementation**: Each card listens for `mousemove`, calculates cursor position relative to card bounds, sets
  `--mouse-x` and `--mouse-y` CSS variables. Card uses
  `radial-gradient(circle at var(--mouse-x) var(--mouse-y), rgba(0,255,136,0.15), transparent 60%)` as an overlay.
- **Border glow**: Cards have a 1px border that glows brighter near the cursor (same radial gradient on `::before`
  pseudo-element)
- **Typography**: System sans-serif, feature titles 1.4rem weight 600, descriptions 0.95rem weight 400

## Palette

- Background: `#0a0a0a`
- Card bg: `#141414` with `border: 1px solid #2a2a2a`
- Glow primary: `#00ff88` (green)
- Glow secondary: `#ff0088` (pink, used in hue-shift)
- Text: `#e0e0e0` (headings), `#888888` (body)
- Icon accent: `#00ff88`

## Content

- **Section title**: "Built For Explorers" with subtle gradient text (`background-clip: text`)
- **6 feature cards** (3x2 grid):
    1. "Route Drafting" — Pick a start and a summit; legs draw against the contour lines
    2. "Offline Maps" — Download regions, navigate without signal
    3. "Group Sync" — Real-time position sharing with your group
    4. "Weather Integration" — Live forecasts along your route
    5. "Photo Timeline" — Auto-organize photos by GPS + timestamp
    6. "Local Insights" — Hidden gems recommended by local guides
- Each card: unicode/CSS icon at top, title, 2-line description

## Anti-Patterns

- No glow effect on cards without hover — cards are dark/subtle by default
- No glow color that doesn't shift — the iridescence is key
- No mouse tracking on touch devices — use a static subtle glow on tap
- No icon images — use CSS shapes or unicode characters

## Accessibility (WCAG 2.2 AA)

- Cards are non-interactive (informational) — no need for button/link role
- If cards link to detail pages, use `<a>` with descriptive text
- Text contrast: `#e0e0e0` on `#141414` = 12:1 (excellent)
- `prefers-reduced-motion: reduce` → disable hue-shift animation, static subtle border glow
- Mouse glow: purely decorative, does not convey information
- Section landmark: `<section aria-labelledby="features-heading">`
- Grid layout uses semantic list: `<ul>` with `<li>` per card

## Technical

- Single `index.html`, inline CSS + JS
- JS: `mousemove` event on each card, `getBoundingClientRect()` for position calc
- CSS: `hue-rotate()` animation on the glow gradient (2s cycle)
- CSS Grid: `grid-template-columns: repeat(auto-fill, minmax(320px, 1fr))`
- Card `::before`: absolute positioned overlay for border glow, `pointer-events: none`
- Responsive: 1 column on mobile, cards get tap-activated glow via `touchstart`
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
