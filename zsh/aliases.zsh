# ⚡ CLI Stack Aliases & Shell Helpers

# TUI Tools
alias lg="lazygit"
alias ld="lazydocker"

# Editor & Browser
alias t="ttt"
alias tb="terminal-browser"

# Atuin (Shell History Search)
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
elif [ -f "$HOME/.atuin/bin/env" ]; then
  . "$HOME/.atuin/bin/env"
  eval "$(atuin init zsh)"
fi
