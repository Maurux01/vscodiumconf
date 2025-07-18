#!/bin/bash

# Verificar si vscodium está instalado
if ! command -v codium &> /dev/null; then
    echo "VS Codium no está instalado. Instalando con yay..."
    if ! command -v yay &> /dev/null; then
        echo "yay no está instalado. Por favor instala yay primero."
        exit 1
    fi
    yay -S --noconfirm vscodium-bin
else
    echo "VS Codium ya está instalado."
fi

# Directorios de configuración de VS Codium
CONFIG_DIR="$HOME/.config/VSCodium/User"
EXTENSIONS_DIR="$HOME/.config/VSCodium/extensions"

# Crear directorios si no existen
mkdir -p "$CONFIG_DIR/snippets"
mkdir -p "$EXTENSIONS_DIR"

# Copiar settings.json y keybindings.json si existen
if [ -f "../settings/settings.json" ]; then
    cp "../settings/settings.json" "$CONFIG_DIR/settings.json"
    echo "settings.json copiado."
fi
if [ -f "../settings/keybindings.json" ]; then
    cp "../settings/keybindings.json" "$CONFIG_DIR/keybindings.json"
    echo "keybindings.json copiado."
fi

# Copiar snippets
if [ -d "../settings/snippets" ]; then
    cp ../settings/snippets/* "$CONFIG_DIR/snippets/" 2>/dev/null || true
    echo "Snippets copiados."
fi

# Copiar lista de extensiones
if [ -f "../extensions/extensions.list" ]; then
    echo "Instalando extensiones desde extensions.list..."
    while read extension; do
        codium --install-extension "$extension"
    done < "../extensions/extensions.list"
fi

echo "Configuración aplicada."
