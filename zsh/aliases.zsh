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

# Herdr Environment
export HERDR_CONFIG_PATH="$HOME/developer/personal/herdr-config/config.toml"

# Multi-account Agents
# OpenCode Profiles
alias opencode-personal='XDG_DATA_HOME="$HOME/.local/share/opencode-profiles/personal" opencode'
alias opencode-trabajo='XDG_DATA_HOME="$HOME/.local/share/opencode-profiles/trabajo" opencode'

# Codex Multi-Account Switcher (Zero-revocation)
alias cs="codex-switch"
alias codex-mart="codex-switch mart"
alias codex-personal="codex-switch personal"
