#!/bin/zsh

# ============================================================================
# Angular Component Roller
# Randomly selects Angular-ecosystem animated components per agent, generates
# a CLAUDE.md, and launches parallel Claude instances to build unique SPAs.
#
# Usage: ./run-roller.sh [count]    (default: 8 agents)
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COUNT="${1:-8}"

BOLD='\033[1m'; DIM='\033[2m'; RESET='\033[0m'
RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'
MAGENTA='\033[0;35m'; YELLOW='\033[0;33m'; BLUE='\033[0;34m'
ORANGE='\033[38;5;208m'; PINK='\033[38;5;213m'; LIME='\033[38;5;118m'
TEAL='\033[38;5;30m'; VIOLET='\033[38;5;135m'; GOLD='\033[38;5;220m'
CORAL='\033[38;5;209m'; SKY='\033[38;5;117m'; WHITE='\033[1;37m'; BROWN='\033[38;5;130m'

ALL_COLORS=("$RED" "$GREEN" "$CYAN" "$MAGENTA" "$YELLOW" "$BLUE" "$ORANGE" "$PINK" "$LIME" "$TEAL" "$VIOLET" "$GOLD" "$CORAL" "$SKY" "$WHITE" "$BROWN")

# ── Component Pools (Angular ecosystem) ──────────────────────────────────────

BACKGROUNDS=(
  "AuroraGradient|Animated aurora borealis using CSS animated gradient blobs with filter:blur(80px), 3-4 color stops drifting slowly"
  "SilkRibbon|Smooth animated SVG sine-wave ribbons layered at different speeds and opacities"
  "ParticleField|Canvas particle system with configurable count, colors, speed, and mouse interaction"
  "WavePattern|Multi-layered CSS/SVG wave animation at bottom of sections"
  "GradientMesh|Animated mesh gradient using 4+ large blurred color spots orbiting slowly"
  "DotGrid|Interactive CSS grid of dots that react to mouse proximity with scale/opacity changes"
  "GridPerspective|CSS perspective-transformed grid lines receding to vanishing point"
  "PlasmaFlow|CSS hue-rotating radial gradients creating plasma effect"
  "ConicSwirl|Animated conic-gradient rotation for metallic/rainbow swirl backgrounds"
  "NoiseGrain|Subtle animated SVG noise/grain texture overlay"
  "FloatingOrbs|Soft gradient orbs floating with CSS keyframe animations"
  "HalftonePattern|SVG/Canvas Fermat spiral dot pattern with slow rotation"
  "LightRays|CSS animated light ray beams radiating from a point"
  "StarField|Canvas star field with parallax depth and drift"
  "RippleEffect|CSS concentric circle ripples expanding outward"
  "ChromaticBlur|Chromatic aberration blur effect on background elements"
)

TEXT_EFFECTS=(
  "SplitReveal|Text splits into chars/words, each staggers in with translateY + opacity via IntersectionObserver"
  "BlurIn|Text blurs from invisible to sharp, word by word, using CSS filter transitions"
  "TypeWriter|Typewriter effect with blinking cursor using CSS steps() animation"
  "GlitchText|RGB-split glitch effect using CSS clip-path keyframes and text-shadow"
  "GradientText|Animated gradient color sweep across text using background-clip:text"
  "DecryptText|Matrix-style characters scramble then resolve to final text via JS"
  "CountUp|Animated number counter that counts from 0 to target value"
  "ScrambleReveal|Letters randomly scramble through alphabet before settling"
  "NeonGlow|Text with pulsing neon glow using text-shadow animation"
  "ShinyText|Shimmering shine sweep across text using animated linear-gradient"
  "LetterFlip|3D CSS perspective letter flip revealing colored back face on hover"
  "StaggerCascade|Elements stagger-cascade in on scroll via IntersectionObserver with delay per child"
  "WavyText|Text with CSS wave animation on each letter"
  "FallingLetters|Letters drop in from above with bounce physics"
  "CircularText|Text arranged in a circle using CSS transforms, optionally spinning"
  "ScrollFloat|Text parallax-floats based on scroll position"
)

COMPONENTS=(
  "SpotlightCard|Card with mouse-tracking radial gradient spotlight that follows cursor via CSS custom properties"
  "TiltCard|3D perspective card tilt on mousemove with translateZ depth layers and specular highlight"
  "GlassCard|Frosted glass card with backdrop-filter:blur, transparent background, thin white border"
  "AnimatedList|List items that scale+fade in when entering viewport using IntersectionObserver"
  "StarBorder|Animated rotating star/sparkle border using conic-gradient on ::before pseudo-element"
  "BentoGrid|Bento-style grid layout with hover expand effects"
  "FlipCard|Card that flips 180deg on hover to show back content"
  "MorphButton|Button that morphs shape/size on hover with smooth transitions"
  "ElasticSlider|Range slider with elastic rubber-band snap animation"
  "ProgressRing|Animated SVG circular progress indicator"
  "AccordionStack|Stacked accordion panels with smooth expand/collapse"
  "PricingToggle|Pricing tier cards with animated monthly/yearly toggle"
  "TimelineCards|Vertical timeline with alternating cards that animate in on scroll"
  "MasonryGrid|CSS-only masonry grid with hover zoom"
  "ParallaxCard|Cards with multi-layer parallax on mouse move"
  "ToastStack|Animated notification toast stack"
)

ANIMATIONS=(
  "ClickSpark|Canvas spark particles burst on click with configurable color, size, count"
  "SmoothCursor|Custom cursor circle that follows mouse with CSS lerp easing"
  "GlassCursor|Glass-effect cursor circle with backdrop-filter:blur following mouse"
  "MagnetPull|Interactive elements pull toward cursor when nearby"
  "TrailEffect|Fading trail of elements following cursor movement"
  "ScrollProgress|Animated progress bar showing scroll position"
  "HoverGlow|Elements gain glowing aura on hover with box-shadow animation"
  "RippleClick|Material-style ripple effect on button click"
  "ParallaxScroll|Multi-speed parallax layers on scroll"
  "ElasticHover|Elements stretch/squash elastically on hover"
  "MorphHover|Elements morph border-radius on hover"
  "InkSpread|Ink-spread reveal effect on hover"
)

PAGE_TYPES=(
  "landing page with hero, features section, and CTA"
  "portfolio showcase with project grid and bio"
  "SaaS pricing page with tier comparison"
  "interactive dashboard with stats and charts"
  "creative agency homepage with case studies"
  "product launch page with countdown and signup"
  "blog/magazine layout with featured articles"
  "app onboarding flow with step wizard"
  "photo gallery with lightbox"
  "developer tools landing with code examples"
  "music/event page with lineup and tickets"
  "restaurant menu with categories and ordering"
  "real estate listings with filters"
  "fitness/health tracker dashboard"
  "e-commerce product detail page"
  "social media profile page"
)

THEMES=(
  "dark theme, bg:#0a0a0a, text:#e0e0e0, accent picked from component colors"
  "light theme, bg:#fafafa, text:#1a1a1a, accent picked from component colors"
  "deep navy theme, bg:#0d1b2a, text:#e0e1dd, accent:#778da9"
  "warm dark theme, bg:#1a0a00, text:#fff4e6, accent:#ff8c00"
  "cool minimal theme, bg:#f0f4f8, text:#2d3748, accent:#4299e1"
  "neon dark theme, bg:#0d0d0d, text:#f0f0f0, accent:#ff00ff and #00ffff"
  "earthy theme, bg:#faf9f6, text:#2d2d2d, accent:#8b4513"
  "purple haze theme, bg:#0f0c29, text:#ffffff, accent:#a18cd1"
)

# ── Helpers ──────────────────────────────────────────────────────────────────

pick_random() {
  local -a arr=("${@}")
  echo "${arr[$((RANDOM % ${#arr[@]}))]}"
}

pick_n_unique() {
  local n=$1; shift
  local -a pool=("${@}")
  local -a remaining=("${pool[@]}")
  for ((i=0; i<n && ${#remaining[@]}>0; i++)); do
    local idx=$((RANDOM % ${#remaining[@]}))
    echo "${remaining[$idx]}"
    remaining=("${remaining[@]:0:$idx}" "${remaining[@]:$((idx+1))}")
  done
}

generate_claude_md() {
  local bg_entry="$1" theme="$2" page_type="$3"
  shift 3
  local -a text_entries=() comp_entries=() anim_entries=()
  while [[ $# -gt 0 ]]; do
    case "$1" in
      TEXT:*) text_entries+=("${1#TEXT:}") ;;
      COMP:*) comp_entries+=("${1#COMP:}") ;;
      ANIM:*) anim_entries+=("${1#ANIM:}") ;;
    esac; shift
  done

  local bg_name="${bg_entry%%|*}" bg_desc="${bg_entry#*|}"

  cat <<CLAUDE
# Random Roll — Angular-Inspired Vanilla SPA

You are building a **${page_type}** using Angular-ecosystem inspired component effects.

## Theme
${theme}

## Your Component Roll

### Background: ${bg_name}
${bg_desc}

### Text Effects
$(for entry in "${text_entries[@]}"; do echo "- **${entry%%|*}**: ${entry#*|}"; done)

### UI Components
$(for entry in "${comp_entries[@]}"; do echo "- **${entry%%|*}**: ${entry#*|}"; done)

### Animations
$(for entry in "${anim_entries[@]}"; do echo "- **${entry%%|*}**: ${entry#*|}"; done)

## Rules

- Create a SINGLE \`index.html\` file in the CURRENT directory
- ALL CSS and JS must be inline (no external dependencies, no npm, no bundler)
- Implement each component effect using vanilla HTML/CSS/JS
- The visual effect must match the component description above
- Semantic HTML5 (\`<main>\`, \`<section>\`, \`<nav>\`, \`<header>\`)
- WCAG 2.2 AA: 4.5:1 contrast, visible focus indicators, keyboard navigable
- \`prefers-reduced-motion: reduce\` → disable all animation
- \`<html lang="en">\`, \`<meta name="viewport">\`
- Mobile-responsive (stack under 768px)
- Decorative elements: \`aria-hidden="true"\`
- Make it visually stunning — this is a showcase
CLAUDE
}

# ── Main ─────────────────────────────────────────────────────────────────────

echo ""
echo "${BOLD}  Angular Component Roller — ${COUNT} agents${RESET}"
echo "${DIM}  Each gets a random Angular-inspired combo${RESET}"
echo ""

pids=()
rm -f /tmp/ng-roll-*.done /tmp/ng-roll-*.reported

cleanup() {
  echo ""; echo "${RED}  Interrupted${RESET}"
  kill "${pids[@]}" 2>/dev/null
  rm -f /tmp/ng-roll-*.done /tmp/ng-roll-*.reported
  exit 1
}
trap cleanup INT TERM

for ((i=1; i<=COUNT; i++)); do
  c="${ALL_COLORS[$((RANDOM % ${#ALL_COLORS[@]}))]}"
  slug="ng-roll-$(printf '%02d' $i)"

  bg=$(pick_random "${BACKGROUNDS[@]}")
  theme=$(pick_random "${THEMES[@]}")
  page_type=$(pick_random "${PAGE_TYPES[@]}")

  text_count=$((RANDOM % 2 + 2))
  comp_count=$((RANDOM % 2 + 2))

  text_picks=()
  while IFS= read -r line; do text_picks+=("TEXT:$line"); done < <(pick_n_unique $text_count "${TEXT_EFFECTS[@]}")
  comp_picks=()
  while IFS= read -r line; do comp_picks+=("COMP:$line"); done < <(pick_n_unique $comp_count "${COMPONENTS[@]}")
  anim_pick="ANIM:$(pick_random "${ANIMATIONS[@]}")"

  bg_name="${bg%%|*}"

  git -C "$REPO_ROOT" worktree remove --force "/tmp/$slug" 2>/dev/null
  rm -rf "/tmp/$slug"
  git -C "$REPO_ROOT" worktree prune 2>/dev/null
  git -C "$REPO_ROOT" branch -D "$slug" 2>/dev/null
  git -C "$REPO_ROOT" worktree add "/tmp/$slug" -b "$slug" HEAD 2>/dev/null

  rm -rf "/tmp/$slug/reactbits-showcase"

  generate_claude_md "$bg" "$theme" "$page_type" "${text_picks[@]}" "${comp_picks[@]}" "$anim_pick" > "/tmp/$slug/CLAUDE.md"

  echo "  ${c}●${RESET} ${BOLD}${slug}${RESET} ${DIM}— ${bg_name} + ${page_type}${RESET}"

  (cd "/tmp/$slug" && unset CLAUDECODE && claude -p "Build the page described in CLAUDE.md. Create index.html in the current directory with ALL CSS and JS inline. Make it visually stunning." --dangerously-skip-permissions </dev/null &>"/tmp/${slug}.log"; touch "/tmp/${slug}.done") &
  pids+=($!)
done

echo ""
echo "${DIM}  Waiting for all ${COUNT} agents...${RESET}"
echo ""

completed=0
while [ $completed -lt $COUNT ]; do
  for ((i=1; i<=COUNT; i++)); do
    slug="ng-roll-$(printf '%02d' $i)"
    if [ -f "/tmp/${slug}.done" ] && [ ! -f "/tmp/${slug}.reported" ]; then
      completed=$((completed + 1))
      touch "/tmp/${slug}.reported"
      if [ -f "/tmp/$slug/index.html" ]; then
        size=$(wc -c < "/tmp/$slug/index.html" | tr -d ' ')
        echo "  ${GREEN}●${RESET} ${BOLD}${slug}${RESET} ${GREEN}done${RESET} ${DIM}(${size}b)${RESET}  [${completed}/${COUNT}]"
      else
        echo "  ${RED}●${RESET} ${BOLD}${slug}${RESET} ${RED}no output${RESET}  [${completed}/${COUNT}]"
      fi
    fi
  done
  sleep 1
done

wait
echo ""
echo "${BOLD}${GREEN}  All ${COUNT} done.${RESET}"
echo "${DIM}  Results in /tmp/ng-roll-{01..${COUNT}}/index.html${RESET}"
echo ""
rm -f /tmp/ng-roll-*.done /tmp/ng-roll-*.reported
