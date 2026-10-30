# Strict Architect & Spec-Driven Coder (`strict-architect-coder` v3.0)

**Bridging the Gap Between Client Vision & AI Engineering.**

A universal, modular **Agent Skill Suite** (`SKILL.md` + specialized reference playbooks) engineered for **Antigravity, Claude Code, Cursor, GitHub Copilot, Codex CLI, Windsurf, Cline, and RooCode**.

---

## Why v3.0? The "Client & Engineering Team" Dual-Layer Architecture

Standard AI planning tools (`/plan`, `/grill-me`) fail non-technical or product-focused users because they output walls of programming jargon (`props`, `useState`, `interfaces`, `endpoints`) that a client cannot evaluate—or conversely, if prompted to "keep it simple", the AI loses technical precision and writes buggy code.

**v3.0 solves both problems simultaneously with a Dual-Layer Protocol:**

1. **🎯 Layer 1 — Client-First Presentation (Visible at the top for you to review):**
   - Written **100% in plain, everyday product language** (Zero code jargon).
   - Includes a **Before vs. After Experience Table**, **Visual ASCII Screen Wireframe**, and **Step-by-Step Interactive User Journey** (*"When you click X -> Screen shows Y"*).
   - During `/grill-me` interviews, the AI decides pure technical details silently and only asks you **product/UX questions** with clear real-world Pros & Cons.
2. **🛠️ Layer 2 — AI Technical Spec (Tucked inside a collapsible `<details>` block at the bottom):**
   - Hidden from your reading flow so you are never overwhelmed by code jargon.
   - Contains strict file boundaries (`Modify` vs. `Do Not Touch`), TypeScript/Python contract checks, a 5-State UI Matrix, and atomic micro-tasks so the AI executes code with surgical accuracy.

---

## Repository Structure

```text
strict-architect-coder/
├── SKILL.md                                           # Core v3.0 Dual-Layer Protocol & Laws
├── references/                                        # Progressive Disclosure Playbooks
│   ├── client-communication-and-plan-template.md      # Jargon-to-Client Dictionary & Wireframe Templates
│   ├── planning-and-architecture.md                   # Dependency audit & atomic task decomposition
│   ├── ui-ux-and-frontend.md                          # Cognitive load audit & 5-State UI Matrix
│   └── systematic-debugging.md                        # 4-Step scientific root-cause debugging loop
└── scripts/                                           # Multi-AI Universal Installers
    ├── install.ps1                                    # Windows PowerShell installer
    └── install.sh                                     # macOS / Linux Bash installer
```

---

## Quick Install

### 1. One-Line Install for Antigravity (Global)

**Windows (PowerShell):**
```powershell
git clone https://github.com/Skill-AI-private/Strict-architect-coder.git "$HOME\.gemini\config\skills\strict-architect-coder"
```

**macOS / Linux:**
```bash
git clone https://github.com/Skill-AI-private/Strict-architect-coder.git ~/.gemini/config/skills/strict-architect-coder
```

*(If already cloned previously, simply run `git -C "$HOME\.gemini\config\skills\strict-architect-coder" pull` to update to v3.0!)*

### 2. Universal Install Across Antigravity + Claude Code + Copilot

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
