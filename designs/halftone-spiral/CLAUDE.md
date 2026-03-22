# Halftone Spiral — Contact Page

You are building a **tour planner contact page** with a halftone dot spiral vortex background.

## Visual Identity

- **Effect**: Hundreds of circles arranged in a spiral pattern (Fermat's spiral), with sizes modulated by distance from center and a slow rotation animation. Creates a mesmerizing halftone print effect.
- **Implementation**: Generate dots via JS on a `<canvas>`. Use golden angle (137.508 degrees) for spiral placement. Dot radius varies with `sin(distance * 0.02 + time * 0.001)`. Entire pattern rotates slowly via canvas `rotate()`. Draw dots as filled circles with varying opacity.
- **Layout**: Split layout — left side has the halftone canvas (decorative), right side has the contact form. On mobile, canvas becomes a header background behind the form.
- **Typography**: Clean geometric sans-serif (`'Segoe UI', system-ui, sans-serif`), form labels uppercase 0.75rem letter-spacing 1px
- **Print-inspired aesthetic**: Black and accent on warm paper

## Palette

- Background: `#f5f0eb` (warm paper)
- Dots: `#1a1a1a` (varying opacity 0.1 to 0.8)
- Accent dots: `#e63946` (red, 20% of dots)
- Form side bg: `#ffffff`
- Input borders: `#457b9d` (steel blue)
- Submit button: `#e63946` bg, `#ffffff` text

## Content

- **Left panel**: Canvas with spiral + overlaid text "Get In Touch" in large, light weight
- **Right panel — Contact form**:
  - Name input
  - Email input
  - Tour interest dropdown (Alpine, Coastal, Desert, Jungle, Arctic)
  - Message textarea
  - "Send Message" button
- Below form: address, email, phone in a small footer
- Social links row (unicode icons)

## Anti-Patterns

- No uniform dot sizes — variation is what makes halftone interesting
- No rotation speed faster than 60s per revolution
- No form without proper labels — every input needs a visible label
- No canvas bleeding into the form area on mobile

## Accessibility (WCAG 2.2 AA)

- Canvas: `role="img"` + `aria-label="Decorative halftone spiral pattern"`, `aria-hidden="true"`
- Every form input: visible `<label>` with matching `for` attribute
- Email: `type="email"`, `autocomplete="email"`
- Name: `autocomplete="name"`
- Required fields: `required` attribute + visual asterisk
- Error states: red border + inline error text (not just color)
- `prefers-reduced-motion: reduce` → static spiral, no rotation
- Submit button focus: `outline: 3px solid #e63946; outline-offset: 3px`
- Form wrapped in `<form>` with `aria-label="Contact form"`

## Technical

- Single `index.html`, inline CSS + JS
- Canvas rendering via `requestAnimationFrame`
- Spiral math: `r = sqrt(i) * spacing`, `theta = i * goldenAngle + time`
- CSS Grid: `grid-template-columns: 1fr 1fr` on desktop
- Responsive: single column under 768px, canvas becomes 200px tall header
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- `<meta name="color-scheme" content="light">`
