<#
.SYNOPSIS
Universal Installer (v4.0 Auto-Pilot & Anti-Amnesia Edition) for:
  1. Always-On Autopilot Rules (GEMINI.md, CLAUDE.md, AGENTS.md, always-on-autopilot.md) -> Zero-Prompt Activation!
  2. strict-architect-coder (v4.0 Dual-Layer + Graphify + Persistent Project Memory Skill)
  3. ui-ux-design-master (12 GitHub Design Repos + 4 Usability/Stability Pillars Skill)
  4. Graphify CLI Integration (Graphify-Labs/graphify)
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
    Write-Host "[OK] Skill Ready: strict-architect-coder (v4.0) -> $Dest1" -ForegroundColor Green

    # 2. Install ui-ux-design-master
    $Source2 = Join-Path $RepoRoot "ui-ux-design-master"
    $Dest2 = Join-Path $BaseSkillsDir "ui-ux-design-master"
    if (Test-Path $Source2) {
        if (-not (Test-Path $Dest2)) {
            New-Item -ItemType Directory -Force -Path $Dest2 | Out-Null
        }
        Copy-Item -Path (Join-Path $Source2 "SKILL.md") -Destination $Dest2 -Force
        Copy-Item -Path (Join-Path $Source2 "references") -Destination $Dest2 -Recurse -Force
        Write-Host "[OK] Skill Installed: ui-ux-design-master (16-in-1) -> $Dest2" -ForegroundColor Cyan
    }
}

function Install-AlwaysOnRules {
    $RuleWithFrontmatter = Join-Path $RepoRoot "rules\always-on-autopilot.md"
    $RuleStandalone = Join-Path $RepoRoot "rules\GEMINI.md"

    if ($Target -in @("all", "antigravity")) {
        $GlobalRulesDir = "$HOME\.gemini\config\rules"
        if (-not (Test-Path $GlobalRulesDir)) {
            New-Item -ItemType Directory -Force -Path $GlobalRulesDir | Out-Null
        }
        Copy-Item -Path $RuleWithFrontmatter -Destination (Join-Path $GlobalRulesDir "always-on-autopilot.md") -Force
        Copy-Item -Path $RuleStandalone -Destination "$HOME\.gemini\GEMINI.md" -Force
        Copy-Item -Path $RuleStandalone -Destination "$HOME\.gemini\config\GEMINI.md" -Force
        Write-Host "[OK] Always-On Autopilot Rule Installed Globally for Antigravity (Zero-Prompt Mode Active!)" -ForegroundColor Magenta
    }

    if ($Target -in @("all", "claude")) {
        if (-not (Test-Path "$HOME\.claude")) {
            New-Item -ItemType Directory -Force -Path "$HOME\.claude" | Out-Null
        }
        Copy-Item -Path $RuleStandalone -Destination "$HOME\.claude\CLAUDE.md" -Force
        Write-Host "[OK] Always-On Autopilot Rule Installed Globally for Claude Code (~/.claude/CLAUDE.md)" -ForegroundColor Magenta
    }

    if ($Target -eq "workspace") {
        $WsRulesDir = Join-Path $WorkspacePath ".agents\rules"
        if (-not (Test-Path $WsRulesDir)) {
            New-Item -ItemType Directory -Force -Path $WsRulesDir | Out-Null
        }
        Copy-Item -Path $RuleWithFrontmatter -Destination (Join-Path $WsRulesDir "always-on-autopilot.md") -Force
        Copy-Item -Path $RuleStandalone -Destination (Join-Path $WorkspacePath "GEMINI.md") -Force
        Copy-Item -Path $RuleStandalone -Destination (Join-Path $WorkspacePath "AGENTS.md") -Force
        Write-Host "[OK] Workspace Always-On Rules (GEMINI.md, AGENTS.md, .agents/rules/) Installed -> $WorkspacePath" -ForegroundColor Magenta
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

Install-AlwaysOnRules

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
