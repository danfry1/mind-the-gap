#!/usr/bin/env bash
#
# Mind the Gap showcase — sets up a tmux session for r/unixporn screenshots
#
# Prerequisites:
#   brew install tmux fastfetch
#   Ghostty with Mind the Gap theme applied
#   Neovim with Mind the Gap theme installed
#   lazygit with Mind the Gap theme (see cli/lazygit/)
#
# Usage:
#   1. Open Ghostty fullscreen
#   2. Run: bash assets/showcase.sh
#   3. Screenshot (Cmd+Shift+3 for full screen)
#   4. Kill session when done: tmux kill-session -t showcase
#   5. Run: git update-index --no-assume-unchanged assets/example.tsx

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SESSION="showcase"
THEME_CONF="$REPO_DIR/tmux/mindthegap-theme.conf"
FASTFETCH_CONF="$REPO_DIR/assets/fastfetch.jsonc"

cd "$REPO_DIR"

# Hide modified example.tsx from git so lazygit shows clean state
git update-index --assume-unchanged assets/example.tsx

# Kill existing session if present
tmux kill-session -t "$SESSION" 2>/dev/null || true

# Create session with neovim in the left pane
tmux new-session -d -s "$SESSION" -c "$REPO_DIR" -x "$(tput cols)" -y "$(tput lines)"
tmux source-file "$THEME_CONF"

# Left pane: neovim — prevent LSP from starting (--cmd runs before plugins),
# keep treesitter highlighting, absolute line numbers, no sign column
tmux send-keys -t "$SESSION" "nvim --cmd 'lua vim.lsp.start = function() return 0 end' -c 'set number norelativenumber signcolumn=no' -c 'normal gg' assets/example.tsx" Enter

# Right side: split vertically, top = lazygit (40% width)
tmux split-window -h -t "$SESSION" -c "$REPO_DIR" -l 40%
tmux send-keys -t "$SESSION" "lazygit" Enter

# Wait for lazygit to start, then press 4 to jump to commits panel
sleep 1
tmux send-keys -t "$SESSION" "4"

# Bottom-right: split horizontally, clear then fastfetch
tmux split-window -v -t "$SESSION" -c "$REPO_DIR" -l 45%
tmux send-keys -t "$SESSION" "clear && fastfetch --config $FASTFETCH_CONF" Enter

# Focus the neovim pane
tmux select-pane -t "$SESSION:.0"

tmux attach -t "$SESSION"
