#!/usr/bin/env bash
# Empacota a extensão para envio ao extensions.gnome.org (EGO).
# Inclui apenas o necessário em runtime: extension.js, metadata.json,
# stylesheet.css, icons/ e locale/*.mo compilado a partir de po/.
# Nunca inclui .git, .gitignore, screenshots/, po/*.po ou README.
set -euo pipefail
cd "$(dirname "$0")"

rm -f dist/*.shell-extension.zip

gnome-extensions pack . \
    --extra-source=icons \
    --podir=po \
    --gettext-domain=claude-status@oakz.org \
    --force \
    --out-dir=dist/

echo "Pacote gerado em dist/"
