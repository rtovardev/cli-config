# ⚡ CLI Stack & Tools Configuration

Configuración centralizada, declarativa y automatizada para las herramientas de línea de comandos (CLI/TUI) y shell personal.

Forma la tercera capa del stack de desarrollo:
1. **[ghostty-config](https://github.com/rtovardev/ghostty-config):** Emulador de terminal (Catppuccin Mocha, blur, fuentes).
2. **[herdr-config](https://github.com/rtovardev/herdr-config):** Multiplexor y orquestador de agentes de IA.
3. **[cli-config](https://github.com/rtovardev/cli-config):** Paquetes Homebrew, TUI apps y configuración de shell.

---

## 🧰 Herramientas Incluidas

| Herramienta | Función | Alias | Configuración |
|---|---|---|---|
| **[Atuin](https://atuin.sh/)** | Historial de shell con SQLite, búsqueda difusa (`daemon-fuzzy`) y sync | `Ctrl + R` / `↑` | `atuin/config.toml` |
| **[Lazygit](https://github.com/jesseduffield/lazygit)** | TUI para Git (tema Catppuccin Mocha sincronizado con Ghostty) | `lg` | `lazygit/config.yml` |
| **[Lazydocker](https://github.com/jesseduffield/lazydocker)** | TUI para Docker y Docker Compose | `ld` | `lazydocker/config.yml` |
| **[TTT](https://github.com/eugenioenko/ttt)** | Terminal Text Tool (Editor IDE en terminal integrado con Herdr) | `t` / `ttt` | `ttt/` |
| **[GitHub CLI](https://cli.github.com/)** | Gestión de repositorios, PRs e issues | `gh` | Estándar de sistema |

---

## 🚀 Instalación y Uso

### 1. Clonar el repositorio
```bash
git clone https://github.com/rtovardev/cli-config.git ~/developer/personal/cli-config
cd ~/developer/personal/cli-config
```

### 2. Ejecutar el instalador
El script instala las fórmulas declaradas en el `Brewfile` vía Homebrew, enlaza los archivos de configuración (`~/.config/`) e integra los alias en `~/.zshrc`:
```bash
./install.sh
```

### 3. Recargar la shell
```bash
source ~/.zshrc
```
