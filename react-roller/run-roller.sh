#!/bin/zsh

# ============================================================================
# React Component Roller
# Randomly selects ReactBits components per agent, generates a CLAUDE.md,
# and launches parallel Claude instances to build unique SPAs.
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

# ── Component Pools ──────────────────────────────────────────────────────────

BACKGROUNDS=(
  "Aurora|WebGL aurora borealis shader via OGL. Props: colorStops (3 hex colors), amplitude, blend, speed"
  "Silk|Three.js silk fabric shader. Props: speed, scale, color (hex), noiseIntensity, rotation"
  "Particles|OGL particle field. Props: particleCount, particleSpread, speed, particleColors, moveParticlesOnHover, alphaParticles"
  "Hyperspeed|Star Wars hyperspace tunnel effect"
  "Waves|Animated sine wave background"
  "Ballpit|Three.js physics ball pit. Props: count, gravity, size, colors"
  "Iridescence|Iridescent color-shifting surface shader"
  "Lightning|Animated lightning bolt effect"
  "Threads|Flowing thread/string animation"
  "Galaxy|Spiral galaxy star field"
  "GridDistortion|Mouse-reactive grid distortion effect"
  "LiquidChrome|Chrome liquid metal shader"
  "Plasma|Plasma color cycling effect"
  "Orb|Floating gradient orb with glow"
  "LetterGlitch|Glitching letter background effect"
  "GridMotion|Animated grid with motion"
  "Beams|Light beam rays effect"
  "DotGrid|Interactive dot grid pattern"
  "Dither|Dithered gradient effect"
  "LiquidEther|Liquid ethereal flow shader"
  "Prism|Light prism refraction effect"
  "SoftAurora|Soft aurora glow (simpler than Aurora)"
  "FloatingLines|Floating animated lines"
  "ColorBends|Color-bending gradient flow"
  "RippleGrid|Rippling grid pattern"
  "Balatro|Balatro-style psychedelic shader"
)

TEXT_ANIMATIONS=(
  "SplitText|GSAP-powered text split + stagger animation. Props: text, delay, duration, splitType (chars/words/lines), from, to, tag"
  "BlurText|Text blurs in word-by-word or char-by-char. Props: text, delay, animateBy (words/characters)"
  "DecryptedText|Matrix-style text decryption reveal. Props: text, speed, revealDirection, animateOn (view/hover)"
  "ShinyText|Shimmering shine sweep across text. Props: text, speed, color, shineColor, spread"
  "CountUp|Animated number counter. Props: to, from, duration, separator"
  "GlitchText|RGB-split glitch effect on text. Props: children, speed, enableShadows, enableOnHover"
  "GradientText|Animated gradient color cycling on text"
  "FuzzyText|Text with fuzzy/vibrating edges on hover"
  "CircularText|Text arranged in a circle, optionally spinning"
  "RotatingText|Text that rotates through multiple values"
  "ScrollVelocity|Text speed tied to scroll velocity"
  "ScrollReveal|Text reveals on scroll position"
  "ScrollFloat|Text floats/parallaxes on scroll"
  "TrueFocus|Focus highlight that follows reading position"
  "ASCIIText|Text rendered in ASCII art style"
  "ScrambledText|Text scrambles then resolves"
  "TextPressure|Text weight changes with cursor pressure/proximity"
  "FallingText|Letters fall in with physics"
  "VariableProximity|Font weight varies by cursor distance"
  "CurvedLoop|Text on a curved looping path"
  "Shuffle|Letters shuffle into place"
  "TextType|Typewriter effect"
)

COMPONENTS=(
  "SpotlightCard|Mouse-tracking radial spotlight on card hover. Props: children, className, spotlightColor"
  "TiltedCard|3D perspective tilt on hover. Props: imageSrc, captionText, rotateAmplitude, scaleOnHover"
  "AnimatedList|Scroll-animated list items. Props: items (string[]), showGradients, enableArrowNavigation"
  "Counter|Animated digit counter with spring physics. Props: value, places"
  "StarBorder|Animated star/sparkle border around any element. Props: as, color, speed, children"
  "Stack|Swipeable card stack. Props: images, direction"
  "Dock|macOS-style dock with magnification. Props: items, magnification"
  "ElasticSlider|Slider with elastic rubber-band snap"
  "TiltedCard|3D perspective card tilt on hover"
  "BounceCards|Cards that bounce in on scroll"
  "PixelCard|Card with pixel-dissolve hover effect"
  "FlowingMenu|Menu items with flowing hover effect"
  "CircularGallery|Images in a 3D circular carousel"
  "Carousel|Standard carousel with transitions"
  "Masonry|Masonry grid layout"
  "MagicBento|Bento grid with magic hover effects"
  "ProfileCard|Animated profile card component"
  "GlassIcons|Frosted glass icon buttons"
  "Folder|Animated folder open/close component"
  "GooeyNav|Gooey blob navigation menu"
  "DecayCard|Card with decay/dissolve effect"
  "Stepper|Multi-step progress component"
  "InfiniteMenu|Infinite scrolling menu"
  "CardSwap|Cards that swap positions"
)

ANIMATIONS=(
  "ClickSpark|Spark particles on click anywhere. Props: sparkColor, sparkSize, sparkRadius, sparkCount"
  "Magnet|Element follows cursor with magnetic pull"
  "SplashCursor|Fluid splash effect following cursor"
  "BlobCursor|Blob shape that follows cursor"
  "CrossHair|Crosshair cursor replacement"
  "PixelTrail|Pixelated trail following cursor"
  "ImageTrail|Images trail behind cursor movement"
  "Ribbons|Flowing ribbon animation"
  "MetaBalls|Metaball blob merging animation"
  "MetallicPaint|Metallic paint drip effect"
  "GlareHover|Glare light reflection on hover"
  "ElectricBorder|Electric current border animation"
  "Noise|Noise grain overlay"
  "ShapeBlur|Shape that blurs and morphs"
  "StickerPeel|Sticker peel-off animation"
  "LaserFlow|Laser beam flow animation"
  "GhostCursor|Ghost trail following cursor"
  "Antigravity|Elements float upward on hover"
  "MagicRings|Concentric animated rings"
  "PixelTransition|Pixel-dissolve page transition"
)

# Pro blocks from @reactbits-pro registry. Slug = kebab(name) + "-tw".
# Install: `npx shadcn@latest add @reactbits-pro/<slug>` (Pro/Ultimate tier required).
# Descriptions are best-guess from name; agent recreates the effect in vanilla CSS/JS anyway.
BLOCKS=(
  "3d-letter-swap-tw|Letters flip through 3D space to swap values"
  "3d-text-reveal-tw|Headline reveals with 3D perspective rotation"
  "agentic-ball-tw|AI agent orb with pulse/listen/speak states"
  "ai-blob-tw|Generative AI blob with morphing gradients"
  "ascii-cursor-tw|Cursor rendered as live ASCII characters"
  "ascii-waves-tw|Wave field rendered in ASCII glyphs"
  "aurora-blur-tw|Aurora gradient with heavy bloom/blur diffusion"
  "black-hole-tw|Gravitational lens / event-horizon shader"
  "blur-highlight-tw|Blurred color swatch highlight behind inline text"
  "blurred-rays-tw|Soft blurred light rays radiating from a source"
  "center-flow-tw|Radial flow lines converging on page center"
  "chroma-card-tw|Card with chromatic aberration split on hover"
  "chroma-waves-tw|RGB-split wave field"
  "circle-gallery-tw|Image gallery laid out around a circle"
  "circles-tw|Overlapping animated color circles"
  "click-stack-tw|Stacked cards that fan out on click"
  "color-loops-tw|Looping color-cycle gradient band"
  "comparison-slider-tw|Before/after image reveal with draggable handle"
  "credit-card-tw|Animated 3D credit card mock"
  "custom-cursor-tw|Replaceable custom cursor template"
  "depth-card-tw|Card with parallax depth layers"
  "device-tw|Device (phone/laptop) mockup with screen content"
  "dither-cursor-tw|Dithered pixel trail cursor"
  "dither-wave-tw|Dithered pixel wave background"
  "dot-shift-tw|Dot grid that shifts on pointer proximity"
  "draggable-grid-tw|Grid of tiles you can drag and rearrange"
  "falling-rays-tw|Light rays falling from top of viewport"
  "flame-paths-tw|Flame-like streaks tracing SVG paths"
  "frame-border-tw|Animated decorative frame border for sections"
  "glass-cursor-tw|Glass/refraction cursor lens"
  "glass-flow-tw|Flowing frosted-glass stripes"
  "glitter-warp-tw|Glittering particle warp tunnel"
  "globe-tw|Interactive 3D globe with markers/arcs"
  "gradient-bars-tw|Vertical gradient bars with animated fill"
  "gradient-blob-tw|Soft morphing gradient blob background"
  "gradient-carousel-tw|Carousel whose background shifts gradient per slide"
  "grain-wave-tw|Grainy noise + wave composite background"
  "halftone-vortex-tw|Halftone dots swirling into a vortex"
  "halftone-wave-tw|Halftone dot wave field"
  "hover-preview-tw|Link hover shows floating preview card"
  "infinite-gallery-tw|Endless scrolling image gallery"
  "light-droplets-tw|Glowing liquid droplets drifting upward"
  "lightspeed-tw|Starfield streaking into lightspeed"
  "liquid-ascii-tw|Liquid flow rendered in ASCII"
  "liquid-bars-tw|Vertical bars flowing like liquid"
  "liquid-lines-tw|Flowing liquid stripes background"
  "liquid-swap-tw|Liquid morph transition between two states"
  "metallic-swirl-tw|Metallic chrome swirl shader"
  "modal-cards-tw|Stacked modal cards with depth transitions"
  "mosaic-tw|Animated mosaic tile composition"
  "neon-reveal-tw|Neon outline that draws on to reveal content"
  "parallax-cards-tw|Cards with multi-layer parallax on scroll"
  "particle-text-tw|Text formed from animated particles"
  "perspective-grid-tw|Perspective grid floor / Tron-style"
  "pixelate-hover-tw|Element pixelates in/out on hover"
  "portal-tw|Circular portal effect revealing another scene"
  "preloader-tw|Branded page preloader / intro sequence"
  "radial-liquid-tw|Radial liquid bloom from a center point"
  "retro-lines-tw|Retro 80s horizon line gradient"
  "rising-lines-tw|Vertical lines rising with stagger"
  "rotating-cards-tw|Cards that rotate around an axis"
  "rotating-stars-tw|Star field rotating around the viewport"
  "rubber-fluid-tw|Rubber/fluid blob deformation"
  "shader-card-tw|Card whose surface is a live shader"
  "shader-reveal-tw|Shader-driven reveal transition"
  "shader-waves-tw|Generic shader wave background"
  "shadow-bars-tw|Animated long-shadow bars composition"
  "silk-waves-tw|Silk fabric wave background"
  "simple-graph-tw|Minimal animated line/area chart"
  "simple-swirl-tw|Minimal swirling gradient"
  "smooth-cursor-tw|Smoothly interpolated cursor follower"
  "square-matrix-tw|Grid of squares pulsing in patterns"
  "squircle-shift-tw|Squircle shapes shifting / morphing"
  "staggered-text-tw|Staggered letter reveal animation"
  "star-burst-tw|Star burst radial lines emanation"
  "star-swipe-tw|Star-shaped wipe transition"
  "swirl-blend-tw|Two colors swirling and blending"
  "synaptic-shift-tw|Synaptic network nodes firing/shifting"
  "text-cube-tw|Words displayed on faces of a rotating cube"
  "text-path-tw|Text following a curved SVG path"
  "text-scatter-tw|Letters scatter apart and reassemble"
  "vortex-tw|Particle vortex centered on viewport"
  "warp-twister-tw|Twisting warp distortion shader"
  "warped-card-tw|Card with warp/bulge lens distortion"
  "watercolor-tw|Watercolor paint bleed background"
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
  local idx=$((RANDOM % ${#arr[@]}))
  echo "${arr[$idx]}"
}

pick_n_unique() {
  local n=$1; shift
  local -a pool=("${@}")
  local -a picked=()
  local -a remaining=("${pool[@]}")

  for ((i=0; i<n && ${#remaining[@]}>0; i++)); do
    local idx=$((RANDOM % ${#remaining[@]}))
    picked+=("${remaining[$idx]}")
    remaining=("${remaining[@]:0:$idx}" "${remaining[@]:$((idx+1))}")
  done
  printf '%s\n' "${picked[@]}"
}

generate_claude_md() {
  local bg_entry="$1" theme="$2" page_type="$3"
  shift 3
  local -a text_entries=() comp_entries=() anim_entries=() block_entries=()

  # Parse remaining args (prefixed with category)
  while [[ $# -gt 0 ]]; do
    case "$1" in
      TEXT:*) text_entries+=("${1#TEXT:}") ;;
      COMP:*) comp_entries+=("${1#COMP:}") ;;
      ANIM:*) anim_entries+=("${1#ANIM:}") ;;
      BLOCK:*) block_entries+=("${1#BLOCK:}") ;;
    esac
    shift
  done

  local bg_name="${bg_entry%%|*}"
  local bg_desc="${bg_entry#*|}"

  cat <<CLAUDE
# Random Roll — React + ReactBits

You are building a **${page_type}** using real ReactBits components.

## Theme
${theme}

## Your Component Roll

### Background: ${bg_name}
${bg_desc}
Install: \`npx shadcn@latest add @react-bits/${bg_name}-TS-TW\`

### Text Animations
$(for entry in "${text_entries[@]}"; do
  local name="${entry%%|*}" desc="${entry#*|}"
  echo "- **${name}**: ${desc}"
  echo "  Install: \`npx shadcn@latest add @react-bits/${name}-TS-TW\`"
done)

### UI Components
$(for entry in "${comp_entries[@]}"; do
  local name="${entry%%|*}" desc="${entry#*|}"
  echo "- **${name}**: ${desc}"
  echo "  Install: \`npx shadcn@latest add @react-bits/${name}-TS-TW\`"
done)

### Animations
$(for entry in "${anim_entries[@]}"; do
  local name="${entry%%|*}" desc="${entry#*|}"
  echo "- **${name}**: ${desc}"
  echo "  Install: \`npx shadcn@latest add @react-bits/${name}-TS-TW\`"
done)

### Featured Block (ReactBits Pro)
$(for entry in "${block_entries[@]}"; do
  local slug="${entry%%|*}" desc="${entry#*|}"
  echo "- **${slug}**: ${desc}"
  echo "  Install: \`npx shadcn@latest add @reactbits-pro/${slug}\` (requires Pro/Ultimate license)"
done)

## Rules

- Create a SINGLE \`index.html\` file in the CURRENT directory
- ALL CSS and JS must be inline (no external dependencies, no npm, no bundler)
- Since you cannot use npm: RECREATE each component's effect using vanilla JS/CSS
  inspired by the ReactBits component descriptions above
- The visual effect must match the component name (e.g., Aurora = animated gradient blobs, Silk = flowing fabric pattern)
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
echo "${BOLD}  React Component Roller — ${COUNT} agents${RESET}"
echo "${DIM}  Each gets a random ReactBits combo${RESET}"
echo ""

pids=()
rm -f /tmp/react-roll-*.done /tmp/react-roll-*.reported

cleanup() {
  echo ""
  echo "${RED}  Interrupted — killing all instances...${RESET}"
  kill "${pids[@]}" 2>/dev/null
  rm -f /tmp/react-roll-*.done /tmp/react-roll-*.reported
  exit 1
}
trap cleanup INT TERM

for ((i=1; i<=COUNT; i++)); do
  c="${ALL_COLORS[$((RANDOM % ${#ALL_COLORS[@]}))]}"
  slug="roll-$(printf '%02d' $i)"

  # Random selections
  bg=$(pick_random "${BACKGROUNDS[@]}")
  theme=$(pick_random "${THEMES[@]}")
  page_type=$(pick_random "${PAGE_TYPES[@]}")

  # Pick 2-3 text animations, 2-3 components, 1 animation
  text_count=$((RANDOM % 2 + 2))
  comp_count=$((RANDOM % 2 + 2))

  text_picks=()
  while IFS= read -r line; do text_picks+=("TEXT:$line"); done < <(pick_n_unique $text_count "${TEXT_ANIMATIONS[@]}")
  comp_picks=()
  while IFS= read -r line; do comp_picks+=("COMP:$line"); done < <(pick_n_unique $comp_count "${COMPONENTS[@]}")
  anim_pick="ANIM:$(pick_random "${ANIMATIONS[@]}")"
  block_pick="BLOCK:$(pick_random "${BLOCKS[@]}")"

  bg_name="${bg%%|*}"

  # Set up worktree
  git -C "$REPO_ROOT" worktree remove --force "/tmp/$slug" 2>/dev/null
  rm -rf "/tmp/$slug"
  git -C "$REPO_ROOT" worktree prune 2>/dev/null
  git -C "$REPO_ROOT" branch -D "$slug" 2>/dev/null
  git -C "$REPO_ROOT" worktree add "/tmp/$slug" -b "$slug" HEAD 2>/dev/null

  # Remove reactbits-showcase if present
  rm -rf "/tmp/$slug/reactbits-showcase"

  # Generate CLAUDE.md
  generate_claude_md "$bg" "$theme" "$page_type" "${text_picks[@]}" "${comp_picks[@]}" "$anim_pick" "$block_pick" > "/tmp/$slug/CLAUDE.md"

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
    slug="roll-$(printf '%02d' $i)"
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
echo "${DIM}  Results in /tmp/roll-{01..${COUNT}}/index.html${RESET}"
echo ""

rm -f /tmp/react-roll-*.done /tmp/react-roll-*.reported
