# Playbook: UI/UX Usability Auditing & Frontend Engineering

Use this playbook whenever the user asks to create, fix, or optimize user interfaces, user flows, buttons, forms, or visual interactions.

---

## 1. Cognitive Load & User Flow Audit (`[MODE: DISCOVERY]`)

When a user says *"This UI is confusing/hard to use"* or questions a specific UI element (e.g., *"Why is there a Complete button here when I don't know if this step needs code?"*):

1. **Map the User's Mental Model vs. Current UI:**
   - **What does the user currently see?** (Labels, buttons, status indicators).
   - **What information is missing before the user can take action?** (e.g., Does the step require manual action, AI code generation, or review? Is a button shown prematurely?).
2. **Audit Action Clarity (Button & Control Rules):**
   - **No Blind Actions:** Never show a primary action button (like *"Complete"*, *"Submit"*, or *"Next"*) without making the current step's prerequisite state and consequence obvious.
   - **Contextual Labeling:** Replace vague labels (*"Complete"*, *"OK"*, *"Run"*) with specific, state-aware labels (e.g., *"Mark Review Complete (No Code Needed)"*, *"Generate Code for Step 2"*, *"Approve & Continue to Step 3"*).
   - **Progressive Disclosure:** Hide or disable secondary/completion actions until required preconditions are met, or display a clear helper badge explaining *why* an action is available.

---

## 2. The 5-State UI Completeness Matrix (`[MODE: BLUEPRINT]`)

Every interactive component or screen must explicitly account for all 5 states before coding:

| UI State | Required Visual & Functional Behavior |
| :--- | :--- |
| **1. Empty / Initial** | Clear onboarding hint, step badge (e.g., `Requires Code` vs. `Discussion Only`), and obvious starting action. |
| **2. Loading / Pending** | Disable duplicate clicks, show active progress indicator, and provide a **Cancel/Stop** escape hatch for long tasks. |
| **3. Partial / In-Progress** | Show clearly what has been completed and what remains before the final action is unlocked. |
| **4. Error / Blocked** | Explain *what* failed in plain language and provide a direct recovery action (Retry / Edit). |
| **5. Completed / Success** | Visual confirmation (checkmark/badge) and smooth transition to the next logical step. |

---

## 3. Frontend Execution Guardrails

- **Preserve Layout & Responsive Integrity:** Check flex/grid containers, overflow behavior (`min-w-0`, text truncation/wrapping), and mobile/desktop breakpoints.
- **Zero Backend Drift:** Do not touch backend APIs or CLI runners when solving a frontend usability problem unless a new data field is strictly required and approved in `[MODE: BLUEPRINT]`.
