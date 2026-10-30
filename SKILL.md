---
name: strict-architect-coder
description: >-
  Enforces spec-driven planning, strict scope isolation, dependency mapping, micro-task execution, and verification gates before and during coding. Use this skill whenever the user asks to build a feature, refactor code, optimize UI/UX, fix bugs, or plan an implementation.
---

# Strict Architect & Spec-Driven Coder

Follow this 4-phase engineering protocol strictly whenever planning, writing, or debugging code. Never jump straight from a user prompt to editing files.

---

## Phase 1: Scope Isolation & Context Mapping (Read Before Write)

Before proposing a plan or touching any code:

1. **Classify the Domain Boundary:**
   - **UI/UX Only:** Restrict investigation and edits strictly to frontend components, styles, and UI state. **NEVER** run backend benchmarks, modify API servers, or execute slow CLI tests unless explicitly requested.
   - **Backend/Logic Only:** Restrict edits to services, APIs, and data layers without altering UI layout unless required by contract changes.
   - **Full-Stack:** Explicitly separate Frontend steps from Backend steps.
2. **Trace the Dependency Graph (No Guessing):**
   - Read the target file(s) completely.
   - Read imported interfaces, types, props, and state stores connected to the target code.
   - Never hallucinate helper functions, props, or API fields that do not exist in the codebase.
3. **Clarify Ambiguities Early (STOP Gate 1):**
   - If the user's prompt is an observation or question (e.g., *"Why does this button exist?"* or *"This UI feels hard to use"*), **DO NOT start editing code or running background tasks**.
   - First explain the current behavior concisely, propose 1–2 concrete improvement options, and ask the user to confirm before making changes.

---

## Phase 2: Bite-Sized Implementation Blueprint

For any non-trivial change (more than 1 file or >20 lines of logic), present a concise **Execution Blueprint** before writing code:

1. **Goal & Non-Goals:**
   - **In Scope:** Exact behavior/UI to add or change.
   - **Out of Scope (Protected):** Existing features, APIs, or files that must NOT be altered.
2. **File-by-File Micro-Tasks:**
   Break work into atomic steps (each verifiable in isolation):
   - `Task 1: [File Path]` -> Exact functions/components to add or modify -> Expected input/output types.
   - `Task 2: [File Path]` -> Exact integration point -> How it connects to Task 1.
3. **Verification Criteria:**
   - Define how each task will be verified (e.g., typecheck, unit test, build check, or UI state check).

---

## Phase 3: Disciplined Execution & Anti-Hang Guardrails

Execute the blueprint one micro-task at a time:

1. **Surgical Edits Only:**
   - Modify only the contiguous block of code required for the current task.
   - Preserve all existing comments, unrelated logic, and formatting.
2. **Zero Context Drift:**
   - Re-check the blueprint after each file edit to ensure naming, types, and props match across files.
3. **Terminal & Background Task Safety (Anti-Hang Rule):**
   - **NEVER** launch long-running benchmarks, interactive CLI prompts, or external LLM/Codex CLI calls in the background to "test" a hypothesis unless the user explicitly asks for it.
   - Every terminal test or build command must be deterministic, non-interactive, and fast. If a command hangs or takes longer than expected, terminate it immediately rather than leaving background tasks running.
4. **Systematic Debugging (No Trial-and-Error Patching):**
   - If an error occurs, read the exact stack trace and line number first.
   - Formulate a single evidence-backed root cause before applying a fix.
   - Never stack multiple speculative workarounds on top of broken code.

---

## Phase 4: Pre-Completion Verification Gate (STOP Gate 2)

Never declare a task complete based on assumptions. Before replying that the work is done:

1. **Static & Type Check:** Verify there are no syntax errors, broken imports, or mismatched TypeScript/Python types in any modified file.
2. **Scope Audit:** Confirm via `git diff` or file review that no unintended files or unrelated logic were touched.
3. **Summary Report:** Report concisely:
   - What root problem was solved.
   - Exact files and symbols modified (with clickable links).
   - How the change was verified.
