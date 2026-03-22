# Glass Flow — Tour Dashboard

You are building a **tour planning dashboard** with flowing glassmorphic cards and a custom glass cursor.

## Visual Identity

- **Effect**: Multiple frosted glass cards float over an animated gradient mesh background. Cards have a subtle continuous drift animation (translateY oscillation, 6-8s, alternate). A custom cursor (glass circle, 40px diameter, `backdrop-filter: blur(8px)`) follows the mouse with eased lerp.
- **Background**: Animated mesh gradient — 4 large color spots with `filter: blur(100px)` slowly orbiting, creating an organic gradient mesh
- **Cards**: `backdrop-filter: blur(16px)`, `background: rgba(255,255,255,0.06)`, `border: 1px solid rgba(255,255,255,0.12)`, `border-radius: 20px`, inner glow via `box-shadow: inset 0 0 30px rgba(255,255,255,0.05)`
- **Typography**: System sans-serif, section headers weight 200 letter-spacing 2px uppercase

## Palette

- Background base: `#0f0c29`
- Mesh colors: `#a18cd1` (lavender), `#fbc2eb` (pink), `#667eea` (blue), `#764ba2` (purple)
- Card text: `#ffffff` (headings), `rgba(255,255,255,0.7)` (body)
- Accent: `#a18cd1`

## Content (Dashboard Layout)

- **Top bar**: "TourPlanner Dashboard" title + user avatar circle
- **Sidebar** (left, glass): Nav links — Overview, My Tours, Analytics, Settings (with unicode icons)
- **Main grid** (3 cards):
  - "Active Tours" — number counter (7), mini list of 3 tour names
  - "Distance This Month" — large number "342 km" with a simple CSS bar chart (4 bars)
  - "Upcoming" — next tour card with date, name, difficulty badge
- **Bottom card** (full width): "Recent Activity" — 4 rows showing recent tour completions

## Anti-Patterns

- No opaque cards — transparency is the entire point
- No cursor effect on touch devices — detect and disable
- No card drift animation faster than 5s — keep it calm
- No visible scrollbars — use `scrollbar-width: none` / `::-webkit-scrollbar { display: none }`

## Accessibility (WCAG 2.2 AA)

- All glass card text: minimum 4.5:1 against darkest possible background intersection
- Nav links: `<nav aria-label="Dashboard navigation">`, `<ul>` with `<li>` items
- `prefers-reduced-motion: reduce` → stop card drift and mesh animation, hide custom cursor
- Focus indicators on all interactive elements (2px solid `#a18cd1`)
- Sidebar nav: keyboard navigable, `aria-current="page"` on active item
- Dashboard numbers: use `<data>` element with `value` attribute
- Custom cursor: purely decorative, does not interfere with pointer events (`pointer-events: none`)

## Technical

- Single `index.html`, inline CSS + JS
- CSS Grid: sidebar 240px + main `1fr`, main uses nested grid for cards
- Custom cursor via JS `mousemove` listener + lerp (`current += (target - current) * 0.1`)
- `-webkit-backdrop-filter` for Safari
- Responsive: sidebar collapses to top bar on < 1024px, cards stack vertically
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
