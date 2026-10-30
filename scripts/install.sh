#!/usr/bin/env bash
# Universal Installer (v4.0 Auto-Pilot & Anti-Amnesia Edition)
# Installs Both Skills + Global Always-On Autopilot Rules (GEMINI.md / CLAUDE.md / AGENTS.md)

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
    echo "[OK] Skill Ready: strict-architect-coder (v4.0) -> $dest1"

    if [[ -d "$REPO_ROOT/ui-ux-design-master" ]]; then
        mkdir -p "$dest2"
        cp -f "$REPO_ROOT/ui-ux-design-master/SKILL.md" "$dest2/"
        cp -rf "$REPO_ROOT/ui-ux-design-master/references" "$dest2/"
        echo "[OK] Skill Installed: ui-ux-design-master (16-in-1) -> $dest2"
    fi
}

install_rules() {
    local rule_fm="$REPO_ROOT/rules/always-on-autopilot.md"
    local rule_std="$REPO_ROOT/rules/GEMINI.md"

    if [[ "$TARGET" == "all" || "$TARGET" == "antigravity" ]]; then
        mkdir -p "$HOME/.gemini/config/rules"
        cp -f "$rule_fm" "$HOME/.gemini/config/rules/always-on-autopilot.md"
        cp -f "$rule_std" "$HOME/.gemini/GEMINI.md"
        cp -f "$rule_std" "$HOME/.gemini/config/GEMINI.md"
        echo "[OK] Always-On Autopilot Rule Installed Globally for Antigravity (Zero-Prompt Mode Active!)"
    fi

    if [[ "$TARGET" == "all" || "$TARGET" == "claude" ]]; then
        mkdir -p "$HOME/.claude"
        cp -f "$rule_std" "$HOME/.claude/CLAUDE.md"
        echo "[OK] Always-On Autopilot Rule Installed Globally for Claude Code (~/.claude/CLAUDE.md)"
    fi

    if [[ "$TARGET" == "workspace" ]]; then
        mkdir -p "$WORKSPACE_PATH/.agents/rules"
        cp -f "$rule_fm" "$WORKSPACE_PATH/.agents/rules/always-on-autopilot.md"
        cp -f "$rule_std" "$WORKSPACE_PATH/GEMINI.md"
        cp -f "$rule_std" "$WORKSPACE_PATH/AGENTS.md"
        echo "[OK] Workspace Always-On Rules Installed -> $WORKSPACE_PATH"
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

install_rules
