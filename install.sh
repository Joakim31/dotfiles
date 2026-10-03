#!/usr/bin/env bash
# =============================================================================
# install.sh — script de instalación de dotfiles personales
# =============================================================================
# Codespaces ejecuta este script automáticamente al crear el entorno, si has
# habilitado tu repo de dotfiles en la configuración PERSONAL de Codespaces
# (Settings -> Codespaces -> Dotfiles).
#
# IMPORTANTE (el equilibrio del Bloque D):
#   - devcontainer.json = lo que el PROYECTO necesita (versionado, compartido).
#   - dotfiles          = lo que TÚ prefieres (tu repo, no el del equipo).
# No metas tus dotfiles en el repo del proyecto: impondrías tu shell al equipo.
#
# Buenas prácticas aplicadas aquí:
#   - Idempotente: se puede ejecutar varias veces sin romper nada.
#   - Tolerante: si algo falta, avisa pero no aborta el arranque del entorno.
#   - Rápido: nada que tarde minutos; retrasaría cada Codespace.
#   - SIN SECRETOS: nunca pongas tokens ni claves en un repo de dotfiles.
# =============================================================================
set -uo pipefail
 
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
 
echo "==> Instalando dotfiles desde ${DOTFILES_DIR}"
 
# --- Aliases y configuración de shell (idempotente) ---
MARCA="# >>> dotfiles personales >>>"
if ! grep -q "$MARCA" "$HOME/.bashrc" 2>/dev/null; then
  {
    echo ""
    echo "$MARCA"
    cat "${DOTFILES_DIR}/.aliases"
    echo "# <<< dotfiles personales <<<"
  } >> "$HOME/.bashrc"
  echo "    aliases añadidos a ~/.bashrc"
else
  echo "    aliases ya estaban presentes; se omite"
fi
 
# --- Configuración de git (solo lo que no es sensible) ---
if command -v git >/dev/null 2>&1; then
  git config --global pull.rebase true
  git config --global init.defaultBranch main
  git config --global core.editor "code --wait" 2>/dev/null || true
  echo "    configuración de git aplicada"
else
  echo "    AVISO: git no disponible; se omite su configuración"
fi
 
echo "==> Dotfiles instalados."
 
tiene menú contextual