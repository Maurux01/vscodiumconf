#!/bin/bash

# === Colores ===
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

# === Rutas base ===
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$HOME/.config/VSCodium/User"
EXTENSIONS_DIR="$HOME/.config/VSCodium/extensions"

# === Verificar VSCodium ===
if ! command -v codium &> /dev/null; then
    echo "${YELLOW}VSCodium no está instalado. Intentando instalar con yay...${RESET}"
    if ! command -v yay &> /dev/null; then
        echo "${RED}yay no está instalado. Por favor, instálalo manualmente.${RESET}"
        exit 1
    fi
    yay -S --noconfirm vscodium-bin
else
    echo "${GREEN}VSCodium ya está instalado.${RESET}"
fi

# === Crear directorios ===
mkdir -p "$CONFIG_DIR/snippets"
mkdir -p "$EXTENSIONS_DIR"

# === Copiar configuración ===
if [ -f "$ROOT_DIR/settings/settings.json" ]; then
    cp "$ROOT_DIR/settings/settings.json" "$CONFIG_DIR/"
    echo "${GREEN}✔ settings.json copiado.${RESET}"
else
    echo "${YELLOW}✘ settings.json no encontrado.${RESET}"
fi

if [ -f "$ROOT_DIR/settings/keybindings.json" ]; then
    cp "$ROOT_DIR/settings/keybindings.json" "$CONFIG_DIR/"
    echo "${GREEN}✔ keybindings.json copiado.${RESET}"
else
    echo "${YELLOW}✘ keybindings.json no encontrado.${RESET}"
fi

# === Copiar snippets ===
if [ -d "$ROOT_DIR/snippets" ]; then
    cp "$ROOT_DIR/snippets/"*.json "$CONFIG_DIR/snippets/" 2>/dev/null || true
    echo "${GREEN}✔ Snippets copiados.${RESET}"
else
    echo "${YELLOW}✘ Carpeta snippets no encontrada.${RESET}"
fi

# === Instalar extensiones ===
EXT_FILE="$ROOT_DIR/extensions/extensions.txt"
if [ -f "$EXT_FILE" ]; then
    echo "${GREEN}🧩 Instalando extensiones desde extensions.txt...${RESET}"
    xargs -n1 codium --install-extension < "$EXT_FILE"
    echo "${GREEN}✔ Extensiones instaladas.${RESET}"
else
    echo "${YELLOW}✘ extensions.txt no encontrado.${RESET}"
fi

echo ""
echo "${GREEN}🎉 Configuración de VSCodium aplicada correctamente.${RESET}"



# se debe copiar la carpeta snippets en esta ruta de la carpeta main del sistema /home/user/.config/VSCodium/User/snippets
# los setting van en /home/maurux01/.config/VSCodium/User
# las extensiones se instalan asi xargs -n1 codium --install-extension < extensions.txt
