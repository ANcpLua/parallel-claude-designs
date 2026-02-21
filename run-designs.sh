#!/bin/zsh

RED='\033[0;31m'; BLUE='\033[0;34m'; CYAN='\033[0;36m'; MAGENTA='\033[0;35m'
YELLOW='\033[0;33m'; GREEN='\033[0;32m'; WHITE='\033[1;37m'; BROWN='\033[0;33m'
BOLD='\033[1m'; DIM='\033[2m'; RESET='\033[0m'

declare -A palettes=(
  ["brutalist"]="bg:#FFFFFF fg:#000000 accent:#FF0000"
  ["glassmorphism"]="bg:#0a0a2e fg:#FFFFFF accent:#FFFFFF20"
  ["apple-clean"]="bg:#FFFFFF fg:#1D1D1F accent:#0071E3"
  ["retro-90s"]="bg:#00FFFF fg:#000000 accent:#FF00FF"
  ["material3"]="bg:#FFFBFE fg:#1C1B1F accent:#6750A4"
  ["cyberpunk"]="bg:#0D0D0D fg:#00FF41 accent:#00FF41"
  ["swiss-typography"]="bg:#FFFFFF fg:#000000 accent:#FF0000"
  ["zen-minimal"]="bg:#FAF8F5 fg:#2C2C2C accent:#8B7355"
)

declare -A tasks=(
  ["brutalist"]="Build a developer portfolio with project grid and contact form"
  ["glassmorphism"]="Build a weather dashboard with 5-day forecast cards"
  ["apple-clean"]="Build a product launch page for wireless earbuds"
  ["retro-90s"]="Build a personal homepage with guestbook and hit counter"
  ["material3"]="Build an admin dashboard with sidebar nav and data tables"
  ["cyberpunk"]="Build a crypto trading terminal with live ticker"
  ["swiss-typography"]="Build a design agency landing page with case studies"
  ["zen-minimal"]="Build a meditation app onboarding flow"
)

declare -A colors=(
  ["brutalist"]="$RED" ["glassmorphism"]="$BLUE" ["apple-clean"]="$CYAN"
  ["retro-90s"]="$MAGENTA" ["material3"]="$YELLOW" ["cyberpunk"]="$GREEN"
  ["swiss-typography"]="$WHITE" ["zen-minimal"]="$BROWN"
)

styles=("brutalist" "glassmorphism" "apple-clean" "retro-90s" "material3" "cyberpunk" "swiss-typography" "zen-minimal")

echo ""
echo "${BOLD}  8 Claude Instances x 8 Design Aesthetics${RESET}"
echo "${DIM}  Each gets its own worktree. Zero coordination.${RESET}"
echo ""

pids=()

for style in "${styles[@]}"; do
  palette="${palettes[$style]}"
  task="${tasks[$style]}"
  c="${colors[$style]}"

  # Clean up any leftover branch/worktree, then create fresh
  git worktree remove --force "/tmp/design-$style" 2>/dev/null
  git branch -D "design-$style" 2>/dev/null
  git worktree add "/tmp/design-$style" -b "design-$style"
  echo "  ${c}●${RESET} ${BOLD}${style}${RESET} ${DIM}— launched${RESET}"

  (cd "/tmp/design-$style" && unset CLAUDECODE && claude -p "${task}. Use ${style} aesthetic with palette: ${palette}. Inline CSS only. Write index.html." --dangerously-skip-permissions </dev/null &>/tmp/design-$style.log; touch /tmp/design-$style.done) &
  pids+=($!)
done

echo ""
echo "${DIM}  Waiting for all 8 instances...${RESET}"
echo ""

# Poll for completions
completed=0
while [ $completed -lt 8 ]; do
  for style in "${styles[@]}"; do
    c="${colors[$style]}"
    if [ -f "/tmp/design-$style.done" ] && [ ! -f "/tmp/design-$style.reported" ]; then
      completed=$((completed + 1))
      touch "/tmp/design-$style.reported"
      if [ -f "/tmp/design-$style/index.html" ]; then
        size=$(wc -c < "/tmp/design-$style/index.html" | tr -d ' ')
        echo "  ${c}●${RESET} ${BOLD}${style}${RESET} ${GREEN}done${RESET} ${DIM}(${size}b)${RESET}  [${completed}/8]"
      else
        echo "  ${c}●${RESET} ${BOLD}${style}${RESET} ${RED}no output${RESET}  [${completed}/8]"
      fi
    fi
  done
  sleep 1
done

wait

echo ""
echo "${BOLD}${GREEN}  All 8 done.${RESET}"
echo ""

# Cleanup markers
rm -f /tmp/design-*.done /tmp/design-*.reported
