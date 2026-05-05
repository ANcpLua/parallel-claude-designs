# Letter Flip — Profile Page

You are building a **tour guide profile page** where names and headings use 3D letter-flip animation on hover/scroll.

## Visual Identity

- **Effect**: Each letter in headings is wrapped in a `<span>` with `perspective` and `transform-style: preserve-3d`. On
  hover (or scroll-in), letters flip 180deg on the X-axis with a stagger delay, revealing a differently-colored back
  face.
- **Implementation**: Each letter span has two child spans (front/back) positioned absolutely. CSS `rotateX(180deg)` on
  hover of the parent word container, `transition-delay` increases per letter index (0.03s increment).
  `backface-visibility: hidden` on both faces.
- **Layout**: Single-column profile page — large name at top, bio section, tour stats grid, recent tours list
- **Typography**: Bold monospace for the flipping name (`'SF Mono', 'Fira Code', monospace`), system sans-serif for body
  text
- **Dark theme with warm accents**

## Palette

- Background: `#121212`
- Front face text: `#fafafa`
- Back face text: `#ff6b35` (warm orange)
- Body text: `#b0b0b0`
- Cards/sections: `#1e1e1e` with `border: 1px solid #2a2a2a`
- Accent: `#f7c948` (gold)

## Content

- **Profile header**: Large flipping name "Marco Rossi" + title "Alpine Tour Guide" + circular avatar (CSS gradient
  placeholder)
- **Bio**: 2-3 sentences about the guide, with flipping section title "About"
- **Stats grid** (2x2): "127 Tours Led", "4.97 Rating", "12 Years Exp", "8 Countries"
- **Recent tours list**: 4 tour items with name, date, difficulty tag, distance
- **Contact button** at bottom with flip effect on hover

## Anti-Patterns

- No flip animation on body text — only headings and the name
- No perspective less than 400px — letters must not distort too heavily
- No stagger delay over 0.05s — keep it snappy, not sluggish
- No flip on every mouse movement — trigger once on hover-in, reset on hover-out

## Accessibility (WCAG 2.2 AA)

- Screen readers see plain text — the flip is purely visual CSS
- `prefers-reduced-motion: reduce` → disable all flip transitions, show front face only
- All text meets 4.5:1 contrast on `#121212` background
- Stats grid: `<dl>` (definition list) with `<dt>` label + `<dd>` value
- Interactive elements: visible focus rings (`outline: 2px solid #f7c948`)
- Profile image alt text: `alt="Marco Rossi, Alpine Tour Guide"`

## Technical

- Single `index.html`, inline CSS
- JS only to split text into letter spans on `DOMContentLoaded`
- CSS `transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1)` per letter
- `transform-style: preserve-3d` on letter container, `perspective: 600px` on word container
- Responsive: letter size scales down on mobile, stats grid becomes 2x1
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="dark">`
