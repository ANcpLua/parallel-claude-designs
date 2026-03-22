#!/bin/zsh

# ============================================================================
# Blazor Component Roller
# Randomly selects Blazor-ecosystem inspired components per agent, generates
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

# ── Component Pools (Blazor ecosystem: MudBlazor, Radzen, Blazorise, Fluent UI) ──

BACKGROUNDS=(
  "FluentGradient|Microsoft Fluent Design acrylic material — layered noise texture + gaussian blur + color tint overlay, animated subtly"
  "MudElevation|MudBlazor-inspired elevation system — stacked floating layers with progressive box-shadows creating depth"
  "DotNetPulse|Animated .NET logo-inspired pattern — interconnected dots forming hexagonal mesh with pulse waves"
  "SignalRWave|Real-time data stream visualization — flowing sine waves representing live SignalR connections"
  "WasmParticles|WebAssembly-themed particle system — binary digits (0/1) floating and connecting in a network"
  "BlazorFire|Blazor flame logo-inspired background — animated gradient fire/ember particles rising"
  "AcrylicBlur|Windows 11 acrylic material — heavy backdrop blur with noise grain and color wash"
  "GridPulse|Enterprise data grid pattern — subtle grid lines that pulse and highlight on mouse proximity"
  "NuGetFlow|Package dependency graph visualization — nodes and edges flowing in an organic network layout"
  "AzureCloud|Cloud infrastructure visualization — soft layered cloud shapes drifting with gradient fills"
  "MatrixRain|Code matrix rain — C# syntax keywords falling in green monospace columns"
  "HexMesh|Hexagonal grid mesh with hover-reactive glow, inspired by .NET microservice architecture diagrams"
  "FluentWave|Fluent Design motion wave — smooth bezier wave animation across viewport"
  "RadzenGlow|Radzen-inspired radial glow emanating from center, soft pulsing light effect"
)

TEXT_EFFECTS=(
  "MudTypography|MudBlazor typography scale — text fades in with MudBlazor's type ramp spacing and weight transitions"
  "FluentReveal|Fluent Design reveal effect on text — light follows cursor over characters, highlighting each letter"
  "BlazorRender|Simulated Blazor render lifecycle — text appears char-by-char as if components are mounting"
  "CounterAnimate|Blazor Counter demo inspired — numbers animate up with spring physics"
  "TypewriterCSharp|C# code typewriter — syntax-highlighted code types out with blinking cursor"
  "GlitchCompile|Compilation glitch effect — text scrambles like a build running, then resolves to final output"
  "SignalRStream|Text streams in letter-by-letter as if arriving via real-time SignalR hub"
  "StaggerMount|Component mount stagger — text elements cascade in with delay, simulating Blazor component lifecycle"
  "GradientSweep|Purple-to-blue gradient sweep across text using background-clip:text, animated"
  "TerminalLog|Terminal/console log style text reveal with timestamp prefixes and color-coded severity"
  "FadeScale|Text fades in while scaling from 0.8 to 1.0, triggered by IntersectionObserver"
  "ShimmerLoad|Skeleton loading shimmer that resolves to real text, simulating Blazor loading states"
)

COMPONENTS=(
  "MudCard|MudBlazor card — elevated surface with header, content, actions zones, hover lift animation"
  "MudDataTable|Data table with sortable headers, striped rows, hover highlight, pagination controls"
  "MudDrawer|Slide-out navigation drawer with overlay, hamburger toggle, icon + label nav items"
  "MudChipSet|Interactive chip/tag set with selectable, removable chips and animated add/remove"
  "RadzenChart|Interactive chart — bar/line/donut with animated draw-in on scroll, tooltips on hover"
  "RadzenTimeline|Vertical timeline with alternating sides, animated dot markers, and expandable entries"
  "BlazoriseProgress|Multi-segment animated progress bar with gradient fill and percentage label"
  "FluentPivot|Fluent UI pivot/tab component with animated underline indicator sliding between tabs"
  "FluentDialog|Modal dialog with backdrop blur, slide+fade entrance, focus trap, escape to close"
  "MudStepper|Multi-step form wizard with progress indicator, validation states, animated transitions"
  "RadzenAccordion|Accordion panels with smooth height animation, icon rotation, and nested content"
  "MudAvatar|Avatar group with overlap stack, status indicator dots, and tooltip names"
  "KanbanBoard|Draggable kanban board with columns (To Do, In Progress, Done) and card move animations"
  "MetricDashboard|KPI metric cards with sparkline mini-charts, trend arrows, and animated value updates"
  "NotificationCenter|Notification bell with badge count, dropdown panel with animated toast entries"
  "CommandPalette|Ctrl+K command palette overlay with fuzzy search, keyboard navigation, grouped results"
)

ANIMATIONS=(
  "FluentRevealHighlight|Fluent Design reveal highlight — border and background light follows cursor on interactive elements"
  "MudRipple|MudBlazor ripple effect — Material-style expanding circle on click"
  "LoadingSpinner|.NET-branded loading spinner — animated Blazor flame or spinning gear"
  "SkeletonPulse|Skeleton loading pulse — gray placeholder blocks with shimmer wave animation"
  "ProgressLinear|Linear progress bar — indeterminate animation sliding back and forth"
  "HoverElevate|Cards and buttons gain elevation (box-shadow increase) on hover"
  "TransitionExpand|Smooth expand/collapse transition for panels, drawers, and dropdowns"
  "BadgeBounce|Notification badge bounce-in animation when count changes"
  "ScrollReveal|Elements fade+slide up on scroll via IntersectionObserver"
  "ConfettiCelebrate|Confetti particle burst on success actions"
  "DragShadow|Dragged elements gain elevated shadow and slight rotation"
  "ToastSlide|Toast notifications slide in from edge with auto-dismiss countdown"
)

PAGE_TYPES=(
  "enterprise admin dashboard with sidebar nav, KPI cards, and data tables"
  "project management board with kanban columns and task cards"
  "real-time monitoring dashboard with live metrics and status indicators"
  "user management panel with CRUD table, filters, and role badges"
  "API documentation portal with endpoint explorer and code samples"
  "DevOps pipeline dashboard with build stages and deployment status"
  "analytics dashboard with charts, date range picker, and export"
  "settings page with tabbed sections, toggles, and form validation"
  "file manager with tree view, grid/list toggle, and breadcrumbs"
  "notification center with categorized alerts and read/unread states"
  "customer portal with support tickets, status tracking, and chat"
  "inventory management with searchable table, stock alerts, and categories"
  "team collaboration page with member cards, activity feed, and calendar"
  "CI/CD pipeline visualization with stage nodes and log viewer"
  "SaaS billing dashboard with usage charts, invoice table, and plan selector"
  "code review interface with diff viewer, comment threads, and approval flow"
)

THEMES=(
  "Fluent Dark|bg:#1b1b1b, text:#f3f3f3, accent:#0078d4 (Microsoft Blue), surface:#2d2d2d, border:#404040"
  "Fluent Light|bg:#f5f5f5, text:#242424, accent:#0078d4, surface:#ffffff, border:#e0e0e0"
  "MudBlazor Dark|bg:#1e1e2e, text:#e0e0e0, accent:#7e57c2 (Deep Purple), surface:#27293d, border:#383a4e"
  "MudBlazor Light|bg:#ffffff, text:#424242, accent:#594ae2, surface:#f5f5f5, border:#e0e0e0"
  "Radzen Material|bg:#fafafa, text:#212121, accent:#ff4081 (Pink), surface:#ffffff, border:#e0e0e0"
  "Azure Portal|bg:#1e1e1e, text:#cccccc, accent:#0078d4, surface:#252526, border:#3e3e42 (VS Code inspired)"
  "Blazorise Default|bg:#f8f9fa, text:#212529, accent:#3b82f6, surface:#ffffff, border:#dee2e6"
  "GitHub Dark|bg:#0d1117, text:#c9d1d9, accent:#58a6ff, surface:#161b22, border:#30363d"
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
  local bg_entry="$1" theme_entry="$2" page_type="$3"
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
  local theme_name="${theme_entry%%|*}" theme_desc="${theme_entry#*|}"

  cat <<CLAUDE
# Random Roll — Blazor-Inspired SPA

You are building an **${page_type}** inspired by the Blazor/.NET component ecosystem.
The aesthetic should feel like a polished enterprise application built with MudBlazor, Radzen, or Fluent UI Blazor.

## Theme: ${theme_name}
${theme_desc}

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
- Match the Blazor/.NET enterprise aesthetic — clean, professional, functional
- Use a system font stack: \`'Segoe UI', system-ui, -apple-system, sans-serif\`
- Monospace for code/data: \`'Cascadia Code', 'Fira Code', 'Consolas', monospace\`
- Semantic HTML5 (\`<main>\`, \`<section>\`, \`<nav>\`, \`<header>\`)
- WCAG 2.2 AA: 4.5:1 contrast, visible focus indicators, keyboard navigable
- \`prefers-reduced-motion: reduce\` → disable all animation
- \`<html lang="en">\`, \`<meta name="viewport">\`
- Mobile-responsive (sidebar collapses under 1024px, cards stack under 768px)
- Decorative elements: \`aria-hidden="true"\`
- Make it production-grade polished — this should look like a real Blazor app
CLAUDE
}

# ── Main ─────────────────────────────────────────────────────────────────────

echo ""
echo "${BOLD}  Blazor Component Roller — ${COUNT} agents${RESET}"
echo "${DIM}  Each gets a random Blazor-ecosystem combo${RESET}"
echo ""

pids=()
rm -f /tmp/blazor-roll-*.done /tmp/blazor-roll-*.reported

cleanup() {
  echo ""; echo "${RED}  Interrupted${RESET}"
  kill "${pids[@]}" 2>/dev/null
  rm -f /tmp/blazor-roll-*.done /tmp/blazor-roll-*.reported
  exit 1
}
trap cleanup INT TERM

for ((i=1; i<=COUNT; i++)); do
  c="${ALL_COLORS[$((RANDOM % ${#ALL_COLORS[@]}))]}"
  slug="blazor-roll-$(printf '%02d' $i)"

  bg=$(pick_random "${BACKGROUNDS[@]}")
  theme=$(pick_random "${THEMES[@]}")
  page_type=$(pick_random "${PAGE_TYPES[@]}")

  text_count=$((RANDOM % 2 + 2))
  comp_count=$((RANDOM % 2 + 3))

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

  (cd "/tmp/$slug" && unset CLAUDECODE && claude -p "Build the page described in CLAUDE.md. Create index.html in the current directory with ALL CSS and JS inline. Make it polished and production-grade." --dangerously-skip-permissions </dev/null &>"/tmp/${slug}.log"; touch "/tmp/${slug}.done") &
  pids+=($!)
done

echo ""
echo "${DIM}  Waiting for all ${COUNT} agents...${RESET}"
echo ""

completed=0
while [ $completed -lt $COUNT ]; do
  for ((i=1; i<=COUNT; i++)); do
    slug="blazor-roll-$(printf '%02d' $i)"
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
echo "${DIM}  Results in /tmp/blazor-roll-{01..${COUNT}}/index.html${RESET}"
echo ""
rm -f /tmp/blazor-roll-*.done /tmp/blazor-roll-*.reported
