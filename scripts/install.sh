#!/usr/bin/env bash
# Universal Installer for strict-architect-coder + ui-ux-design-master (macOS / Linux)
# Supports: Antigravity, Claude Code, GitHub Copilot, Cursor, and Workspace installation

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
TARGET="${1:-all}"
WORKSPACE_PATH="${2:-$(pwd)}"

install_suite() {
    local base_dir="$1"
    local dest1="$base_dir/strict-architect-coder"
    local dest2="$base_dir/ui-ux-design-master"

    mkdir -p "$dest1"
    if [[ "$(cd "$REPO_ROOT" && pwd)" != "$(cd "$dest1" && pwd)" ]]; then
        cp -f "$REPO_ROOT/SKILL.md" "$dest1/"
        cp -rf "$REPO_ROOT/references" "$dest1/"
    fi
    echo "[OK] Ready: strict-architect-coder -> $dest1"

    if [[ -d "$REPO_ROOT/ui-ux-design-master" ]]; then
        mkdir -p "$dest2"
        cp -f "$REPO_ROOT/ui-ux-design-master/SKILL.md" "$dest2/"
        cp -rf "$REPO_ROOT/ui-ux-design-master/references" "$dest2/"
        echo "[OK] Installed: ui-ux-design-master -> $dest2"
    fi
}

if [[ "$TARGET" == "all" || "$TARGET" == "antigravity" ]]; then
    install_suite "$HOME/.gemini/config/skills"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "claude" ]]; then
    install_suite "$HOME/.claude/skills"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "copilot" ]]; then
    install_suite "$HOME/.copilot/skills"
fi

if [[ "$TARGET" == "workspace" ]]; then
    install_suite "$WORKSPACE_PATH/.agents/skills"
    install_suite "$WORKSPACE_PATH/.github/skills"
    install_suite "$WORKSPACE_PATH/.claude/skills"
fi
