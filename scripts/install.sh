#!/usr/bin/env bash
# Universal Installer for Strict Architect & Spec-Driven Coder Skill (macOS / Linux)
# Supports: Antigravity, Claude Code, GitHub Copilot, Cursor, and Workspace installation

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(dirname "$SCRIPT_DIR")"
TARGET="${1:-all}"
WORKSPACE_PATH="${2:-$(pwd)}"

install_to() {
    local dest="$1"
    mkdir -p "$dest"
    cp -f "$SKILL_ROOT/SKILL.md" "$dest/"
    cp -rf "$SKILL_ROOT/references" "$dest/"
    echo "[OK] Installed strict-architect-coder to: $dest"
}

if [[ "$TARGET" == "all" || "$TARGET" == "antigravity" ]]; then
    install_to "$HOME/.gemini/config/skills/strict-architect-coder"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "claude" ]]; then
    install_to "$HOME/.claude/skills/strict-architect-coder"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "copilot" ]]; then
    install_to "$HOME/.copilot/skills/strict-architect-coder"
fi

if [[ "$TARGET" == "workspace" ]]; then
    install_to "$WORKSPACE_PATH/.agents/skills/strict-architect-coder"
    install_to "$WORKSPACE_PATH/.github/skills/strict-architect-coder"
    install_to "$WORKSPACE_PATH/.claude/skills/strict-architect-coder"
fi
