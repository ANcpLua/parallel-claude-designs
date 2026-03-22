# Gradient Blob — Pricing Page

You are building a **tour planner pricing page** with animated gradient blob shapes floating behind pricing cards.

## Visual Identity

- **Effect**: 3-4 large amorphous blob shapes made with CSS `border-radius` (set to organic values like `60% 40% 30% 70% / 60% 30% 70% 40%`) filled with gradients, animated to morph shape continuously using `@keyframes` that cycle through different border-radius values.
- **Implementation**: Each blob is a `<div>` with `position: absolute`, `width/height: 300-500px`, gradient backgrounds, `filter: blur(40px)`, animated with CSS `@keyframes morph` changing `border-radius` over 15-20s, infinite, alternate.
- **Layout**: 3 pricing tiers in a row, center tier elevated/highlighted
- **Cards**: White/light cards with strong `border-radius: 24px`, subtle shadow, the highlighted tier has a gradient border (using background-clip trick)
- **Typography**: System sans-serif, price numbers `clamp(2.5rem, 5vw, 3.5rem)` weight 700

## Palette

- Background: `#0c0c1d` (deep navy)
- Blob 1: `linear-gradient(135deg, #6c63ff, #3b82f6)`
- Blob 2: `linear-gradient(135deg, #ff6584, #ff85a1)`
- Blob 3: `linear-gradient(135deg, #6c63ff, #ff6584)`
- Cards: `#ffffff` (regular), gradient border on featured
- Card text: `#1a1a2e` (headings), `#6b7280` (body)
- CTA buttons: `#6c63ff` (primary), `#e5e7eb` (secondary)

## Content

- **Page title**: "Choose Your Journey" centered above cards
- **3 tiers**:
  - **Explorer** ($9/mo): 5 tours/month, basic routes, email support
  - **Adventurer** ($29/mo, featured): unlimited tours, AI optimization, priority support, offline maps
  - **Expedition** ($79/mo): everything + team management, API access, dedicated guide
- Each card: tier name, price, feature list with checkmark icons, CTA button
- Below cards: "All plans include 14-day free trial" centered text
- FAQ toggle section (3 questions) with smooth expand/collapse

## Anti-Patterns

- No static blobs — they must morph continuously
- No identical blob shapes — each has unique animation timing and path
- No featured card without clear visual hierarchy (elevation, border, badge)
- No pricing without clear comparison — align features vertically

## Accessibility (WCAG 2.2 AA)

- Pricing cards: `role="region"` with `aria-label="Explorer plan"` etc.
- Feature lists: proper `<ul>` with `<li>`, checkmarks via CSS `::before` (not img)
- Blobs: `aria-hidden="true"`
- `prefers-reduced-motion: reduce` → stop blob morphing, static shapes
- CTA buttons: visible focus rings, descriptive text ("Choose Explorer", not just "Choose")
- FAQ: `<details>/<summary>` or `<button>` with `aria-expanded`
- Card text on white bg: all text minimum 4.5:1 contrast

## Technical

- Single `index.html`, inline CSS + JS
- CSS-only blob animation (no JS needed for morph)
- JS only for FAQ expand/collapse toggle
- CSS Flexbox for pricing row, `align-items: stretch`
- Featured card: `transform: scale(1.05)` + `z-index: 1`
- Gradient border: `background: linear-gradient(...)` on card wrapper, `padding: 2px`, inner div with solid bg
- Responsive: cards stack vertically under 768px, featured stays visually distinct
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
