# ReactBits Showcase — Student Summary

## 1) What this repo is

This repository is a **React + TypeScript + Vite** single-page demo that showcases animated UI building blocks from
ReactBits. The app renders a landing-style page composed of reusable animation and interaction components.

## 2) Core entry points

- [index.html](index.html): HTML shell with the app mount.
- [src/main.tsx](src/main.tsx): React entrypoint that mounts `<App />`.
- [src/App.tsx](src/App.tsx): Main page composition (hero, features, tours, stats, activity, footer).

## 3) Running and scripts

- [package.json](package.json): project metadata, scripts, and dependencies.
- Run locally: `npm install`, then `npm run dev`.
- Build/preview: `npm run build`, `npm run lint`, `npm run preview`.

## 4) Styling and behavior stack

- Global styling and animation keys: [src/index.css](src/index.css)
- Tailwind/Vite config: [vite.config.ts](vite.config.ts)
- TS
  configs: [tsconfig.json](tsconfig.json), [tsconfig.app.json](tsconfig.app.json), [tsconfig.node.json](tsconfig.node.json)
- Utilities: [src/lib/utils.ts](src/lib/utils.ts)

## 5) Component architecture (important folders)

### Animations

- [src/components/Animations/ClickSpark.tsx](src/components/Animations/ClickSpark.tsx): draws radial click spark effects
  in a canvas overlay.

### Background renderers

- [src/components/Backgrounds/Aurora.tsx](src/components/Backgrounds/Aurora.tsx): animated aurora-style background
  effect.
- [src/components/Backgrounds/Particles.tsx](src/components/Backgrounds/Particles.tsx): particle system used in
  CTA/background sections.
- [src/components/Backgrounds/Silk.tsx](src/components/Backgrounds/Silk.tsx): flowing canvas silk texture effect.

### Text animation components

- [src/components/TextAnimations/CountUp.tsx](src/components/TextAnimations/CountUp.tsx): animated numeric counter for
  statistics.
- [src/components/TextAnimations/GlitchText.tsx](src/components/TextAnimations/GlitchText.tsx): hover/animated text
  distortion effect.
- [src/components/TextAnimations/ShinyText.tsx](src/components/TextAnimations/ShinyText.tsx): glossy moving shine text
  effect.
- [src/components/TextAnimations/BlurText.tsx](src/components/TextAnimations/BlurText.tsx): text fade/unblur entry
  effect.
- [src/components/TextAnimations/DecryptedText.tsx](src/components/TextAnimations/DecryptedText.tsx): decrypt/reveal
  style text transitions.
- [src/components/TextAnimations/SplitText.tsx](src/components/TextAnimations/SplitText.tsx): GSAP split animation text
  by chars/words/lines.

### Reusable UI cards/components

- [src/components/Components/SpotlightCard.tsx](src/components/Components/SpotlightCard.tsx): card with mouse-tracked
  spotlight gradient.
- [src/components/Components/TiltedCard.tsx](src/components/Components/TiltedCard.tsx): motion-based 3D tilt card.
- [src/components/Components/AnimatedList.tsx](src/components/Components/AnimatedList.tsx): animated scrolling list.
- [src/components/Components/StarBorder.tsx](src/components/Components/StarBorder.tsx): animated border-with-glow
  wrapper.
- [src/components/Components/Counter.tsx](src/components/Components/Counter.tsx): generic rolling digit display
  primitive.

### Foundation UI

- [src/components/ui/button.tsx](src/components/ui/button.tsx): reusable button component styled with
  class-variance-authority and shadcn patterns.

## 6) Data/assets and media

- [src/assets/hero.png](src/assets/hero.png): hero image asset.
- [src/assets/react.svg](src/assets/react.svg), [src/assets/vite.svg](src/assets/vite.svg): default template assets.

## 7) Learning path for students

1. Start in [src/main.tsx](src/main.tsx) and [src/App.tsx](src/App.tsx) to understand the app tree.
2. Move to one component folder at a time (`Backgrounds`, `TextAnimations`, `Components`).
3. Use [src/index.css](src/index.css) and Tailwind settings to study global styling flow.
4. Compare package setup in [package.json](package.json) before adding features.
5. Use this as a pattern for a component showcase: isolate one visual primitive, then recompose sections in `App.tsx`.

## 8) Notes

- The current [README.md](README.md) is mostly the default Vite template and does not describe the ReactBits showcase
  content in depth.
- For course material, pair this file with a live walkthrough of [src/App.tsx](src/App.tsx) and whichever component
  folder you want to teach.
