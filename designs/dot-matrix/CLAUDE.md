# Dot Matrix — Stats / Metrics Page

You are building a **tour planner stats/metrics page** where numbers and charts are rendered as animated dot matrix
grids.

## Visual Identity

- **Effect**: Key metrics displayed as large numbers composed of small dots in a grid pattern (like an LED display).
  When a number changes or loads, dots animate into position (scale from 0 to 1 with stagger). A live-updating feel —
  numbers occasionally tick up with dot reformation.
- **Implementation**: Canvas-based dot grid. Define each digit (0-9) as a 5x7 boolean matrix. Render dots at calculated
  positions. On number change, animate each dot's scale using spring physics. Green-on-black terminal aesthetic.
- **Layout**: Dashboard grid — 4 large KPI panels at top, a dot-matrix bar chart below, activity ticker at bottom
- **Typography**: Monospace only (`'SF Mono', 'Fira Code', 'Courier New', monospace`), uppercase labels

## Palette

- Background: `#111111`
- Active dots: `#33ff33` (matrix green) with `box-shadow: 0 0 4px #33ff33`
- Inactive dots: `#1a1a1a` (barely visible grid)
- Danger dots: `#ff3333`
- Text labels: `#33ff33` at 0.7 opacity
- Panel borders: `1px solid #33ff33` at 0.3 opacity

## Content

- **4 KPI panels** (dot matrix numbers):
    - "Total Tours": 12,847 (ticks up by 1 every 5s)
    - "Active Users": 3,291
    - "Km Explored": 847,203
    - "Avg Rating": 4.87
- **Bar chart** (below): 7 bars representing "Tours This Week" (Mon-Sun), each bar made of stacked dots, heights vary
- **Activity ticker** (bottom): scrolling single line — "Marco completed Alpine Ridge · Sarah started Coastal Path ·
  Team Bravo finished Desert Trek" — marquee-style but smooth CSS animation

## Anti-Patterns

- No smooth/anti-aliased rendering on dot numbers — each dot is a crisp circle
- No color variation beyond green/red — strict monochrome matrix feel
- No proportional fonts anywhere — monospace exclusively
- No dot animation faster than 0.3s — readable, not flickering

## Accessibility (WCAG 2.2 AA)

- Canvas dot numbers: each KPI panel also has a hidden `<span>` with the actual number text for screen readers
- `role="img"` + `aria-label` on each canvas
- Activity ticker: `aria-live="polite"` region with actual text content
- `prefers-reduced-motion: reduce` → static dot display, no ticking numbers, ticker paused
- Green on black: `#33ff33` on `#111111` = 9.5:1 contrast (excellent)
- KPI labels visible and descriptive
- Bar chart: `aria-label` with data summary ("Tours this week: Mon 42, Tue 67...")

## Technical

- Single `index.html`, inline CSS + JS
- Each KPI: dedicated `<canvas>` element, JS renders dot grid digit patterns
- Digit matrices: hardcoded 5x7 arrays for each digit 0-9
- Animation: `requestAnimationFrame` loop, spring-based scale per dot
- Bar chart: CSS grid of columns, each column is a stack of `<div>` dots
- Ticker: CSS `@keyframes scroll` with `translateX(-100%)`, `animation: scroll 30s linear infinite`
- `setInterval` for number ticking (5s interval)
- Responsive: KPI grid becomes 2x2 on tablet, 1-column on mobile, dot size scales
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
