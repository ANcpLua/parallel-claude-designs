**Scope:** This directory contains the ReactBits Showcase React 19, TypeScript, and Vite single-page demo plus its classroom outline.

<not_yet_implemented>
- Production route-planning backend, authentication, persisted accounts, map data, offline sync, payments, and API integration.
- Project-specific human README replacing the stock Vite template text.
</not_yet_implemented>

## Source Documents
**does:** Use `README.md` for the current Vite setup notes and `lektor-class-outline.md` for the repo-specific classroom walkthrough.
**does_not_do:** Treat stock Vite template prose as app architecture, copy long-form lesson prose into agent instructions, or delete the class outline during implementation work.

## App Entry Points
**does:** Mount `<App />` from `src/main.tsx` into `index.html`; compose the TourPlanner landing page in `src/App.tsx` with nav, hero, features, tours, stats, activity, CTA, and footer sections.
**does_not_do:** Client routing, server rendering, data fetching, real route planning, authentication, checkout, or external map integration.

## Visual Components
**does:** Keep reusable visual primitives in `src/components/Animations`, `src/components/Backgrounds`, `src/components/TextAnimations`, and `src/components/Components`.
**does_not_do:** Hide shared component behavior inside `src/App.tsx`, fork component copies per section, or add visual primitives without typed props and cleanup paths.

## Rendering Runtime
**does:** Use the existing GSAP, Motion, OGL, Three, and React Three Fiber dependencies for text animation, canvas overlays, particles, aurora, and silk effects.
**does_not_do:** Introduce another animation/rendering engine for effects already covered by the installed stack, leave `requestAnimationFrame` loops alive after unmount, or leak `ResizeObserver`, keyboard, mouse, ScrollTrigger, or WebGL resources.

## Styling System
**does:** Use Tailwind v4 through `@tailwindcss/vite`, shadcn/base-nova tokens from `components.json`, `src/index.css` global theme variables, Geist font imports, and the existing dark visual direction.
**does_not_do:** Add a second design system, scatter global styles into component files, remove `prefers-reduced-motion`, or hardcode private registry keys in CSS or source.

## UI Foundation
**does:** Keep shadcn-style primitives in `src/components/ui`; use `src/components/ui/button.tsx` and `src/lib/utils.ts` for variant styling and class merging.
**does_not_do:** Reimplement `cn`, bypass existing class-variance-authority variants for button-like primitives, or create duplicate utility folders.

## Registry Configuration
**does:** Keep ReactBits registry configuration in `components.json`; read ReactBits Pro access through `REACTBITS_LICENSE_KEY` at tool/runtime boundaries only.
**does_not_do:** Commit license values, replace registry aliases casually, or treat private ReactBits Pro components as public-source material.

## Assets
**does:** Keep app-owned media under `src/assets` and static browser assets under `public`.
**does_not_do:** Depend on remote hero/media URLs for the primary rendered experience or leave unused imported assets after a feature is removed.

## Documentation Linkage
**does:** Keep `CLAUDE.md` as a relative symlink to `AGENTS.md` so Claude-facing and Codex-facing instructions stay identical.
**does_not_do:** Maintain divergent `CLAUDE.md` content or create agent-specific instruction forks in this directory.

## Patterns
- Use `src/App.tsx` as the page composition layer and extract reusable behavior into typed components.
- Use the existing component folder taxonomy: `Animations`, `Backgrounds`, `TextAnimations`, `Components`, `ui`, and `lib`.
- Use ReactBits/shadcn registry configuration through `components.json` and environment-provided `REACTBITS_LICENSE_KEY`.
- Preserve `prefers-reduced-motion` support in `src/index.css` when adding or changing animations.
- Clean up canvas, WebGL, ResizeObserver, `requestAnimationFrame`, keyboard/mouse listeners, and GSAP/ScrollTrigger state in component effects.
- Run `npm run build` and `npm run lint` before handing off code or instruction changes when dependencies are installed.

## Anti-Patterns
- Put reusable behavior, cross-section data plumbing, or component internals directly into `src/App.tsx`.
- Scatter shared visual primitives outside `Animations`, `Backgrounds`, `TextAnimations`, `Components`, `ui`, or `lib`.
- Commit ReactBits license keys, inline private registry tokens, or bypass `components.json` for installed component sources.
- Add motion-heavy effects without checking the existing reduced-motion contract.
- Leave canvas, WebGL, ResizeObserver, `requestAnimationFrame`, keyboard/mouse listeners, or GSAP/ScrollTrigger state alive after unmount.
- Hand off changes without a build and lint attempt when the local dependency install is available.

## Constraints
- `package.json` scripts are the command source: `dev`, `build`, `lint`, and `preview`.
- `npm run build` means `tsc -b && vite build`.
- `npm run lint` means `eslint .`.
- TypeScript app code is governed by `tsconfig.app.json`; Vite config is governed by `tsconfig.node.json`.
- `dist`, `node_modules`, logs, `.env`-style `*.local`, editor folders, and OS files stay ignored through `.gitignore`.
- Generated or vendored component changes must remain readable TypeScript/TSX; no opaque minified source.

## Build & Test
**does:** Use `npm install`, `npm run dev`, `npm run build`, `npm run lint`, and `npm run preview` from this directory.
**does_not_do:** Treat a running dev server as compile proof, commit `dist`, or skip lint/build evidence for TypeScript or component changes.
