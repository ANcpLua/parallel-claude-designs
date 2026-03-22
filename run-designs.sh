#!/bin/zsh

# ============================================================================
# 16 Claude Instances x 16 ReactBits-Inspired SPA Components
# Each style gets its own CLAUDE.md with design-specific rules + WCAG 2.2 AA.
# The script copies designs/{style}/CLAUDE.md into the worktree before launch.
#
# More on CLAUDE.md: https://claude.com/blog/using-claude-md-files
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
COUNT=16

# Terminal colors (16 distinct ANSI 256 colors)
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; BLUE='\033[0;34m'
MAGENTA='\033[0;35m'; CYAN='\033[0;36m'; WHITE='\033[1;37m'
ORANGE='\033[38;5;208m'; PINK='\033[38;5;213m'; LIME='\033[38;5;118m'
TEAL='\033[38;5;30m'; VIOLET='\033[38;5;135m'; GOLD='\033[38;5;220m'
CORAL='\033[38;5;209m'; SKY='\033[38;5;117m'; BROWN='\033[38;5;130m'
BOLD='\033[1m'; DIM='\033[2m'; RESET='\033[0m'

declare -A tasks=(
  ["aurora-blur"]="Build a tour planner hero section with animated aurora borealis gradient background, frosted glass CTA card, stat pills. CSS-only aurora animation with 3-4 blurred gradient blobs drifting slowly."
  ["particle-text"]="Build a tour planner about page where the headline is rendered as particles on canvas. Particles scatter on hover with spring physics and reform. Glass-backed content cards below with mission, team, stats."
  ["liquid-morph"]="Build a tour showcase gallery with SVG feTurbulence + feDisplacementMap liquid morph transitions between tour cards. 6 tour cards in masonry grid, detail panel slides up on selection."
  ["glass-flow"]="Build a tour planning dashboard with flowing glassmorphic cards over animated gradient mesh. Custom glass cursor follows mouse with lerp. Sidebar nav, 3 stat cards, activity feed."
  ["silk-waves"]="Build a tour planner waitlist landing page with animated SVG silk ribbon waves at the bottom. Elegant serif typography, email signup form, avatar stack showing waitlist count."
  ["letter-flip"]="Build a tour guide profile page where names and headings use 3D CSS letter-flip animation on hover. Each letter flips on X-axis with stagger delay revealing colored back face. Profile, bio, stats grid, recent tours."
  ["halftone-spiral"]="Build a tour planner contact page with canvas-rendered halftone dot spiral vortex background (Fermat spiral, golden angle). Split layout: spiral left, contact form right."
  ["gradient-blob"]="Build a tour planner pricing page with CSS animated gradient blob shapes morphing behind 3 pricing tier cards. Blobs use border-radius keyframes. Center tier elevated. FAQ accordion below."
  ["shader-glow"]="Build a tour planner features page with shader-like glow on cards. Mouse position tracked via CSS custom properties creates radial gradient spotlight with hue-shift iridescence. 6 feature cards in grid."
  ["stagger-cascade"]="Build a tour planner blog page where all content elements stagger-cascade in on scroll via IntersectionObserver. Serif editorial typography, article about Dolomites hiking, related articles."
  ["parallax-depth"]="Build a tour planner How It Works page with mouse-tracking 3D parallax depth cards. 4 steps in zigzag timeline, card elements at different translateZ depths, specular highlight follows cursor."
  ["neon-pulse"]="Build a tour planner landing with neon glow navigation (underline expands + glows on hover), neon flicker headline, perspective CSS grid background. Cyberpunk-meets-luxury dark theme."
  ["metallic-swirl"]="Build a tour planner auth/login page with animated metallic conic-gradient swirl background (CSS @property --angle rotation). Centered white login card with email, password, social login."
  ["dot-matrix"]="Build a tour planner stats page with LED-style dot matrix numbers on canvas. Digits composed of 5x7 dot grids with spring-animated transitions. 4 KPI panels, dot bar chart, activity ticker."
  ["flame-trail"]="Build a tour planner CTA page with SVG path flame trails. Particles travel along paths leaving glowing orange/gold trails. Full-viewport centered CTA with trust logos."
  ["black-hole"]="Build a tour planner 404 page with animated black hole. Rotating conic-gradient accretion disk, canvas star field drifting toward center with gravity sim, orbiting 404 text."
)

declare -A colors=(
  ["aurora-blur"]="$VIOLET"      ["particle-text"]="$SKY"
  ["liquid-morph"]="$CORAL"      ["glass-flow"]="$BLUE"
  ["silk-waves"]="$GOLD"         ["letter-flip"]="$ORANGE"
  ["halftone-spiral"]="$RED"     ["gradient-blob"]="$MAGENTA"
  ["shader-glow"]="$GREEN"       ["stagger-cascade"]="$CYAN"
  ["parallax-depth"]="$TEAL"     ["neon-pulse"]="$PINK"
  ["metallic-swirl"]="$WHITE"    ["dot-matrix"]="$LIME"
  ["flame-trail"]="$YELLOW"      ["black-hole"]="$BROWN"
)

styles=(
  "aurora-blur"     "particle-text"    "liquid-morph"    "glass-flow"
  "silk-waves"      "letter-flip"      "halftone-spiral" "gradient-blob"
  "shader-glow"     "stagger-cascade"  "parallax-depth"  "neon-pulse"
  "metallic-swirl"  "dot-matrix"       "flame-trail"     "black-hole"
)

echo ""
echo "${BOLD}  ${COUNT} Claude Instances x ${COUNT} ReactBits-Inspired SPAs${RESET}"
echo "${DIM}  Each gets its own worktree + CLAUDE.md + WCAG 2.2 AA${RESET}"
echo ""

pids=()

# Clear any leftover markers from previous runs
rm -f /tmp/design-*.done /tmp/design-*.reported

# Kill all background claude processes on Ctrl+C
cleanup() {
  echo ""
  echo "${RED}  Interrupted — killing all instances...${RESET}"
  kill "${pids[@]}" 2>/dev/null
  rm -f /tmp/design-*.done /tmp/design-*.reported
  exit 1
}
trap cleanup INT TERM

for style in "${styles[@]}"; do
  task="${tasks[$style]}"
  c="${colors[$style]}"

  # Clean up any leftover branch/worktree, then create fresh
  git worktree remove --force "/tmp/design-$style" 2>/dev/null
  rm -rf "/tmp/design-$style"
  git worktree prune 2>/dev/null
  git branch -D "design-$style" 2>/dev/null
  git worktree add "/tmp/design-$style" -b "design-$style"

  # Inject design-specific CLAUDE.md
  if [ -f "$SCRIPT_DIR/designs/$style/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/designs/$style/CLAUDE.md" "/tmp/design-$style/CLAUDE.md"
  fi

  echo "  ${c}●${RESET} ${BOLD}${style}${RESET} ${DIM}— launched${RESET}"

  (cd "/tmp/design-${style}" && unset CLAUDECODE && claude -p "${task} Follow the CLAUDE.md rules exactly. Single index.html with inline CSS and JS. WCAG 2.2 AA accessible. Support prefers-reduced-motion." --dangerously-skip-permissions </dev/null &>"/tmp/design-${style}.log"; touch "/tmp/design-${style}.done") &
  pids+=($!)
done

echo ""
echo "${DIM}  Waiting for all ${COUNT} instances...${RESET}"
echo ""

# Poll for completions
completed=0
while [ $completed -lt $COUNT ]; do
  for style in "${styles[@]}"; do
    c="${colors[$style]}"
    if [ -f "/tmp/design-$style.done" ] && [ ! -f "/tmp/design-$style.reported" ]; then
      completed=$((completed + 1))
      touch "/tmp/design-$style.reported"
      if [ -f "/tmp/design-$style/index.html" ]; then
        size=$(wc -c < "/tmp/design-$style/index.html" | tr -d ' ')
        echo "  ${c}●${RESET} ${BOLD}${style}${RESET} ${GREEN}done${RESET} ${DIM}(${size}b)${RESET}  [${completed}/${COUNT}]"
      else
        echo "  ${c}●${RESET} ${BOLD}${style}${RESET} ${RED}no output${RESET}  [${completed}/${COUNT}]"
      fi
    fi
  done
  sleep 1
done

wait

echo ""
echo "${BOLD}${GREEN}  All ${COUNT} done.${RESET}"
echo ""

# Open gallery summary
echo "${DIM}  Results in /tmp/design-{style}/index.html${RESET}"
echo "${DIM}  Logs in /tmp/design-{style}.log${RESET}"
echo ""

# Cleanup markers
rm -f /tmp/design-*.done /tmp/design-*.reported
