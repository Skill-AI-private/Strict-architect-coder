<#
.SYNOPSIS
Universal Installer for Strict Architect & Spec-Driven Coder Skill (Windows PowerShell)
Supports: Antigravity, Claude Code, Cursor, GitHub Copilot, Codex / Universal AGENTS.md
#>

param(
    [ValidateSet("all", "antigravity", "claude", "copilot", "workspace")]
    [string]$Target = "all",
    [string]$WorkspacePath = (Get-Location).Path
)

$SkillRoot = Split-Path -Parent $PSScriptRoot

function Copy-SkillFolder([string]$DestDir) {
    if (-not (Test-Path $DestDir)) {
        New-Item -ItemType Directory -Force -Path $DestDir | Out-Null
    }
    Copy-Item -Path (Join-Path $SkillRoot "SKILL.md") -Destination $DestDir -Force
    Copy-Item -Path (Join-Path $SkillRoot "references") -Destination $DestDir -Recurse -Force
    Write-Host "[OK] Installed strict-architect-coder to: $DestDir" -ForegroundColor Green
}

if ($Target -in @("all", "antigravity")) {
    Copy-SkillFolder "$HOME\.gemini\config\skills\strict-architect-coder"
}

if ($Target -in @("all", "claude")) {
    Copy-SkillFolder "$HOME\.claude\skills\strict-architect-coder"
}

if ($Target -in @("all", "copilot")) {
    Copy-SkillFolder "$HOME\.copilot\skills\strict-architect-coder"
}

if ($Target -eq "workspace") {
    Copy-SkillFolder (Join-Path $WorkspacePath ".agents\skills\strict-architect-coder")
    Copy-SkillFolder (Join-Path $WorkspacePath ".github\skills\strict-architect-coder")
    Copy-SkillFolder (Join-Path $WorkspacePath ".claude\skills\strict-architect-coder")
}
