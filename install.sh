#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "⚡ Configurando CLI Stack desde ${SCRIPT_DIR}..."

# 1. Homebrew & Brewfile
if command -v brew >/dev/null 2>&1; then
  echo "📦 Instalando y actualizando fórmulas con Homebrew (Brewfile)..."
  brew bundle --file="${SCRIPT_DIR}/Brewfile"
else
  echo "⚠️ Homebrew no encontrado. Instálalo desde https://brew.sh y vuelve a ejecutar este script."
fi

# 2. Atuin
mkdir -p "${HOME}/.config/atuin"
if [ -e "${HOME}/.config/atuin/config.toml" ] || [ -L "${HOME}/.config/atuin/config.toml" ]; then
  if [ "$(readlink "${HOME}/.config/atuin/config.toml" || true)" != "${SCRIPT_DIR}/atuin/config.toml" ]; then
    BACKUP="${HOME}/.config/atuin/config.toml.bak.$(date +%Y%m%d%H%M%S)"
    echo "📦 Respaldando configuración existente de atuin en ${BACKUP}"
    mv "${HOME}/.config/atuin/config.toml" "${BACKUP}"
    ln -sfn "${SCRIPT_DIR}/atuin/config.toml" "${HOME}/.config/atuin/config.toml"
  fi
else
  ln -sfn "${SCRIPT_DIR}/atuin/config.toml" "${HOME}/.config/atuin/config.toml"
fi
echo "✓ Atuin vinculado: ~/.config/atuin/config.toml -> ${SCRIPT_DIR}/atuin/config.toml"

# 3. Lazygit
mkdir -p "${HOME}/.config/lazygit" "${HOME}/Library/Application Support/lazygit"
ln -sfn "${SCRIPT_DIR}/lazygit/config.yml" "${HOME}/.config/lazygit/config.yml"
ln -sfn "${SCRIPT_DIR}/lazygit/config.yml" "${HOME}/Library/Application Support/lazygit/config.yml"
echo "✓ Lazygit vinculado (Catppuccin Mocha theme aplicado)."

# 4. Lazydocker
mkdir -p "${HOME}/.config/lazydocker" "${HOME}/Library/Application Support/lazydocker"
ln -sfn "${SCRIPT_DIR}/lazydocker/config.yml" "${HOME}/.config/lazydocker/config.yml"
ln -sfn "${SCRIPT_DIR}/lazydocker/config.yml" "${HOME}/Library/Application Support/lazydocker/config.yml"
echo "✓ Lazydocker vinculado."

# 5. TTT
mkdir -p "${HOME}/.config/ttt/plugins"
echo "✓ TTT verificado en ~/.config/ttt/"

# 6. Zsh integration
ZSHRC="${HOME}/.zshrc"
SOURCE_LINE="[ -f \"${SCRIPT_DIR}/zsh/aliases.zsh\" ] && source \"${SCRIPT_DIR}/zsh/aliases.zsh\""

if [ -f "${ZSHRC}" ]; then
  if ! grep -Fq "${SCRIPT_DIR}/zsh/aliases.zsh" "${ZSHRC}"; then
    echo "" >> "${ZSHRC}"
    echo "# CLI Stack integrations & aliases" >> "${ZSHRC}"
    echo "${SOURCE_LINE}" >> "${ZSHRC}"
    echo "✓ Aliases integrados en ~/.zshrc"
  else
    echo "✓ Aliases ya presentes en ~/.zshrc"
  fi
fi

echo "🎉 CLI Stack configurado con éxito. Abre una nueva terminal o ejecuta: source ~/.zshrc"
