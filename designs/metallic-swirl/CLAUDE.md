# Metallic Swirl — Auth / Login Page

You are building a **tour planner auth/login page** with a metallic conic-gradient swirl background.

## Visual Identity

- **Effect**: Full-viewport animated metallic swirl using `conic-gradient` that rotates slowly. The gradient mimics brushed metal with alternating light/dark bands. The login card sits centered over this swirl.
- **Implementation**: A full-screen `<div>` with `background: conic-gradient(from var(--angle), #c0c0c0, #2a2a2a, #c0c0c0, #ffd700, #c0c0c0, #2a2a2a, #c0c0c0)`. JS animates `--angle` from 0deg to 360deg over 20s using `requestAnimationFrame`. CSS `@property --angle` registered for smooth interpolation (or JS fallback).
- **Login card**: Elevated white/light card with strong shadow, centered vertically and horizontally, `border-radius: 16px`, `max-width: 420px`
- **Typography**: System sans-serif, clean and corporate

## Palette

- Swirl: `#c0c0c0` (silver), `#2a2a2a` (dark), `#ffd700` (gold accent)
- Card: `#ffffff` bg, `#1a1a2e` text
- Input: `#f5f5f5` bg, `1px solid #d1d5db` border, `#1a1a2e` text
- Primary button: `linear-gradient(135deg, #c0c0c0, #ffd700)` with dark text
- Links: `#6c63ff`
- Error state: `#ef4444`

## Content

- **Card header**: TourPlanner logo (CSS styled text) + "Welcome Back"
- **Login form**:
  - Email input with label
  - Password input with label + show/hide toggle button
  - "Remember me" checkbox
  - "Sign In" button (full width)
  - "Forgot password?" link
- **Divider**: "or continue with" horizontal rule with text
- **Social login**: 2 buttons — "Google" and "GitHub" (styled as outlined buttons)
- **Footer text**: "Don't have an account? Sign up"

## Anti-Patterns

- No swirl stopping when card is focused — background is independent
- No transparent card — the card must be fully opaque white for readability
- No password visible by default
- No form submission without validation feedback

## Accessibility (WCAG 2.2 AA)

- Every input: visible `<label>` + `for` attribute
- Email: `type="email"`, `autocomplete="email"`
- Password: `type="password"`, `autocomplete="current-password"`
- Show/hide toggle: `<button type="button" aria-label="Show password">` / `aria-label="Hide password"`
- Checkbox: proper `<input type="checkbox">` with `<label>`
- Error messages: `role="alert"`, `aria-live="assertive"`
- `prefers-reduced-motion: reduce` → static swirl at fixed angle
- Card: `role="form"` or `<form>` with `aria-label="Sign in"`
- All interactive elements: visible focus rings
- Swirl div: `aria-hidden="true"`
- Tab order: email → password → toggle → remember → sign in → forgot → google → github → sign up

## Technical

- Single `index.html`, inline CSS + JS
- CSS `@property --angle { syntax: '<angle>'; inherits: false; initial-value: 0deg; }` for smooth conic rotation
- JS fallback for browsers without `@property`: apply rotation via `transform: rotate()` on the swirl div instead
- Card centered: `display: grid; place-items: center; min-height: 100vh`
- Form validation: HTML5 `required` + `pattern` + JS for real-time feedback
- Responsive: card fills width on mobile with 16px padding
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
