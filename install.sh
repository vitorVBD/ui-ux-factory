#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CURSOR_DIR="$HOME/.cursor"

mkdir -p "$CURSOR_DIR/agents"
mkdir -p "$CURSOR_DIR/commands"
mkdir -p "$CURSOR_DIR/ui-ux-factory"

# Linka os subagentes
for file in "$REPO_DIR/.cursor/agents/"*.md; do
  ln -sfn "$file" "$CURSOR_DIR/agents/$(basename "$file")"
done

# Linka os commands (/uiux, etc.)
for file in "$REPO_DIR/commands/"*.md; do
  ln -sfn "$file" "$CURSOR_DIR/commands/$(basename "$file")"
done

# Linka a pasta de scripts
ln -sfn "$REPO_DIR/scripts" "$CURSOR_DIR/ui-ux-factory/scripts"

echo "UI/UX-Factory instalada globalmente em $CURSOR_DIR!"
echo "Reinicie o Cursor (ou recarregue a janela) e digite /uiux no chat de qualquer projeto."