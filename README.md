# Strict Architect & Spec-Driven Coder (`strict-architect-coder` v2.0)

A universal, modular **Agent Skill Suite** (`SKILL.md` + specialized reference playbooks) engineered to make **any AI coding assistant** (Antigravity, Claude Code, Cursor, GitHub Copilot, Codex CLI, Windsurf, Cline, RooCode) plan rigorously, isolate scope, design intuitive UI/UX, and write surgical, verified code.

---

## Architecture of This Skill Suite

```text
strict-architect-coder/
├── SKILL.md                                  # Core 4-Mode State Machine, Complexity Triage & Laws
├── references/                               # Progressive Disclosure Playbooks (Loaded on demand)
│   ├── planning-and-architecture.md          # Dependency audit & atomic task decomposition
│   ├── ui-ux-and-frontend.md                 # Cognitive load audit & 5-State UI Completeness Matrix
│   └── systematic-debugging.md               # 4-Step scientific root-cause debugging loop
└── scripts/                                  # Multi-AI Universal Installers
    ├── install.ps1                           # Windows PowerShell installer
    └── install.sh                            # macOS / Linux Bash installer
```

---

## Why Any AI Performs Better With v2.0

1. **Explicit State Machine Anchoring (`[MODE: DISCOVERY]` -> `[MODE: BLUEPRINT]` -> `[MODE: EXECUTE]` -> `[MODE: VERIFY]`):** Forces any LLM (large or small) to declare its current engineering phase before generating text or calling tools, preventing premature coding.
2. **3-Tier Complexity Triage:** Prevents over-planning trivial 1-line fixes (Tier 1) while enforcing strict blueprints and UX discovery gates on complex features (Tier 2 & Tier 3).
3. **Concrete Blueprint Template:** Gives the model an exact markdown schema to fill out (Objective, Scope Boundary, Impact Check, Atomic Tasks, Verification Plan).
4. **Progressive Disclosure Reference Playbooks:** Keeps token usage low while providing deep checklists for Architecture, UI/UX State Matrices, and Root-Cause Debugging when needed.

---

## Quick Install (All AI Agents)

### 1. One-Line Install for Antigravity (Global)

**Windows (PowerShell):**
```powershell
git clone https://github.com/Skill-AI-private/Strict-architect-coder.git "$HOME\.gemini\config\skills\strict-architect-coder"
```

**macOS / Linux:**
```bash
git clone https://github.com/Skill-AI-private/Strict-architect-coder.git ~/.gemini/config/skills/strict-architect-coder
```

### 2. Universal Install Across Antigravity + Claude Code + Copilot

Clone anywhere and run the installer script:

**Windows (PowerShell):**
```powershell
git clone https://github.com/Skill-AI-private/Strict-architect-coder.git
.\Strict-architect-coder\scripts\install.ps1 -Target all
```

**macOS / Linux:**
```bash
git clone https://github.com/Skill-AI-private/Strict-architect-coder.git
bash ./Strict-architect-coder/scripts/install.sh all
```

### 3. Project / Workspace Install (`.agents/`, `.claude/`, `.github/`)
```powershell
.\Strict-architect-coder\scripts\install.ps1 -Target workspace -WorkspacePath "path\to\your\project"
```
