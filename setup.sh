#!/bin/bash
set -e

# setup.sh - DEPRECATED
# NOTE: This script is deprecated in favor of the agent-driven SOP in bootstrap.md.
# Agents should follow the guidelines in bootstrap.md for a more robust setup.
# -----------------------------------------------------------------------------

echo "--- Initializing Agent Environment (Legacy Mode) ---"
echo "WARNING: This script is deprecated. Refer to bootstrap.md for the new SOP."

# 1. Secret Seeding
created_files=()
while IFS= read -r -d '' example_file; do
    actual_file="${example_file%.example}"
    if [ ! -f "$actual_file" ]; then
        echo "Creating $actual_file from template..."
        cp "$example_file" "$actual_file"
        created_files+=("$actual_file")
    fi
done < <(find personal -name "*.example" -print0)

if [ ${#created_files[@]} -gt 0 ]; then
    echo "Opening new config files for editing: ${created_files[*]}"
    ${EDITOR:-vi} "${created_files[@]}"
fi

# 2. Agent Directory Detection
AGENT_DIRS=("$HOME/.claude" "$HOME/.gemini" "$HOME/.codex" "$HOME/.qwen")
TARGET_DIR=""

for dir in "${AGENT_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        TARGET_DIR="$dir"
        echo "Detected agent directory: $TARGET_DIR"
        break
    fi
done

if [ -z "$TARGET_DIR" ]; then
    read -p "No agent directory detected. Enter path to agent home (or press Enter to skip injection): " TARGET_DIR
fi

if [ -n "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "Injecting persistent files into $TARGET_DIR..."
    
    # Symlink persistent files
    for f in personal/persistent_files/*; do
        if [ -f "$f" ] && [[ "$f" != *.example ]]; then
            ln -sf "$(pwd)/$f" "$TARGET_DIR/$(basename "$f")"
        fi
    done

    # Inject persistent_contents.md
    INDEX_FILE=""
    [ -f "$TARGET_DIR/CLAUDE.md" ] && INDEX_FILE="$TARGET_DIR/CLAUDE.md"
    [ -f "$TARGET_DIR/GEMINI.md" ] && INDEX_FILE="$TARGET_DIR/GEMINI.md"
    [ -f "$TARGET_DIR/README.md" ] && INDEX_FILE="$TARGET_DIR/README.md"

    if [ -n "$INDEX_FILE" ] && [ -f "personal/persistent_contents.md" ]; then
        if ! grep -q "From assets4agents" "$INDEX_FILE"; then
            echo -e "

--- From assets4agents ---
" >> "$INDEX_FILE"
            cat personal/persistent_contents.md >> "$INDEX_FILE"
            echo "Injected persistent_contents.md into $INDEX_FILE"
        fi
    fi
fi

# 3. Tmux Quality of Life
if [ -f "$HOME/.tmux.conf" ] || [ -n "$(command -v tmux)" ]; then
    TMUX_CONF="$HOME/.tmux.conf"
    touch "$TMUX_CONF"
    if ! grep -q "set -g mouse on" "$TMUX_CONF"; then
        echo "Updating $TMUX_CONF with QoL settings..."
        echo -e "
# Added by assets4agents
set -g mouse on
set -g history-limit 200000" >> "$TMUX_CONF"
    fi
fi

echo "--- Setup Complete ---"
echo "Note: You may need to source your shell config or restart your terminal."
