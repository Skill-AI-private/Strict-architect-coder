<#
.SYNOPSIS
Universal Installer for:
  1. strict-architect-coder (v3.5 Dual-Layer + Graphify Knowledge Graph Skill)
  2. ui-ux-design-master (12 GitHub Design Repos + 4 Usability/Stability Pillars Skill)
  3. Graphify CLI Integration (Graphify-Labs/graphify)
Supports: Antigravity, Claude Code, Cursor, GitHub Copilot, and Workspace installation.
#>

param(
    [ValidateSet("all", "antigravity", "claude", "copilot", "workspace")]
    [string]$Target = "all",
    [string]$WorkspacePath = (Get-Location).Path,
    [switch]$WithGraphifyCLI
)

$RepoRoot = Split-Path -Parent $PSScriptRoot

function Install-SkillSuite([string]$BaseSkillsDir) {
    # 1. Install strict-architect-coder
    $Dest1 = Join-Path $BaseSkillsDir "strict-architect-coder"
    if (-not (Test-Path $Dest1)) {
        New-Item -ItemType Directory -Force -Path $Dest1 | Out-Null
    }
    if ((Resolve-Path $RepoRoot).Path -ne (Resolve-Path $Dest1).Path) {
        Copy-Item -Path (Join-Path $RepoRoot "SKILL.md") -Destination $Dest1 -Force
        Copy-Item -Path (Join-Path $RepoRoot "references") -Destination $Dest1 -Recurse -Force
    }
    Write-Host "[OK] Ready: strict-architect-coder (v3.5 + Graphify Engine) -> $Dest1" -ForegroundColor Green

    # 2. Install ui-ux-design-master
    $Source2 = Join-Path $RepoRoot "ui-ux-design-master"
    $Dest2 = Join-Path $BaseSkillsDir "ui-ux-design-master"
    if (Test-Path $Source2) {
        if (-not (Test-Path $Dest2)) {
            New-Item -ItemType Directory -Force -Path $Dest2 | Out-Null
        }
        Copy-Item -Path (Join-Path $Source2 "SKILL.md") -Destination $Dest2 -Force
        Copy-Item -Path (Join-Path $Source2 "references") -Destination $Dest2 -Recurse -Force
        Write-Host "[OK] Installed: ui-ux-design-master (12 Repos + 4 Stability Pillars) -> $Dest2" -ForegroundColor Cyan
    }
}

if ($Target -in @("all", "antigravity")) {
    Install-SkillSuite "$HOME\.gemini\config\skills"
}

if ($Target -in @("all", "claude")) {
    Install-SkillSuite "$HOME\.claude\skills"
}

if ($Target -in @("all", "copilot")) {
    Install-SkillSuite "$HOME\.copilot\skills"
}

if ($Target -eq "workspace") {
    Install-SkillSuite (Join-Path $WorkspacePath ".agents\skills")
    Install-SkillSuite (Join-Path $WorkspacePath ".github\skills")
    Install-SkillSuite (Join-Path $WorkspacePath ".claude\skills")
}

if ($WithGraphifyCLI) {
    Write-Host "[INFO] Checking Graphify CLI (Graphify-Labs/graphify)..." -ForegroundColor Yellow
    if (Get-Command uv -ErrorAction SilentlyContinue) {
        uv tool install graphifyy
        graphify install
    } elseif (Get-Command pip -ErrorAction SilentlyContinue) {
        pip install graphifyy
        graphify install
    } else {
        Write-Host "[TIP] Install Python/uv then run: uv tool install graphifyy && graphify install" -ForegroundColor Yellow
    }
}
