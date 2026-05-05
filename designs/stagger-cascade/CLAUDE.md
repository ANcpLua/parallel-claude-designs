# Stagger Cascade — Blog / Articles Page

You are building a **tour planner blog page** where content elements stagger-cascade in as they enter the viewport.

## Visual Identity

- **Effect**: As the user scrolls, each content element (heading, paragraph, image placeholder, blockquote) fades in and
  slides up with a staggered delay. Children within a section animate sequentially (0.1s apart). Uses
  `IntersectionObserver` to trigger animations.
- **Implementation**: All animatable elements start with `opacity: 0; transform: translateY(30px)`. When observed, add a
  class that transitions to `opacity: 1; transform: translateY(0)` with `transition-delay` based on their index within
  the parent.
- **Layout**: Classic blog layout — centered content column (max-width 720px), generous margins
- **Typography**: Serif for article body (`Georgia, 'Noto Serif', serif`), 1.2rem with 1.8 line-height. Sans-serif for
  meta info and tags.
- **Elegant editorial feel**: Like a premium travel magazine

## Palette

- Background: `#fefefe`
- Text: `#1a1a1a` (body), `#6b7280` (meta)
- Accent: `#2563eb` (links), `#7c3aed` (tags)
- Blockquote border: `#2563eb` left border 4px
- Dividers: `#e5e7eb`
- Code/highlight bg: `#f3f4f6`

## Content

- **Header**: "TourPlanner Journal" top bar, minimal
- **Article**:
    - Title: "The Hidden Trails of the Dolomites" (cascades first)
    - Meta: "March 15, 2026 · 8 min read · Marco Rossi" (cascades second)
    - Hero image placeholder (gradient rectangle, 16:9 ratio, cascades third)
    - Body: 3-4 paragraphs about hiking in the Dolomites
    - A blockquote: "The best views come after the hardest climb"
    - Subheading: "Route Highlights" with a list of 4 points
    - Tags at bottom: #dolomites #hiking #alps #italy
- **Related articles**: 3 small cards at bottom (title + date, stagger in as a group)

## Anti-Patterns

- No elements animating all at once — stagger is the entire point
- No animation duration over 0.6s per element — snappy, not sluggish
- No translateY over 30px — subtle movement, not flying in
- No re-triggering animation once an element has been revealed

## Accessibility (WCAG 2.2 AA)

- `prefers-reduced-motion: reduce` → all elements visible immediately, no animation
- Article: `<article>` with `<header>` containing `<h1>` and `<time>`
- Semantic structure: `<h1>` → `<h2>` hierarchy, `<blockquote>`, `<ul>`
- Body text contrast: `#1a1a1a` on `#fefefe` = 17:1 (excellent)
- Links: underlined + color differentiated
- Tags: `<a>` elements, keyboard accessible
- `IntersectionObserver` is progressive enhancement — content visible without JS
- Skip link to article content

## Technical

- Single `index.html`, inline CSS + JS
- `IntersectionObserver` with `threshold: 0.1`, `rootMargin: '0px 0px -50px 0px'`
- CSS transition: `opacity 0.5s ease, transform 0.5s ease`
- JS sets `transition-delay` on children: `child.style.transitionDelay = index * 0.1 + 's'`
- `observer.unobserve(entry.target)` after triggering — no re-animation
- Responsive: content column `width: min(720px, 90vw)`, images `max-width: 100%`
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="light">`
