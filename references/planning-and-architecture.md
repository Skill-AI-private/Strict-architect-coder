# Playbook: Spec-Driven Planning & Architecture

Use this playbook when executing **Tier 2** or **Tier 3** features, system design, or multi-file refactoring.

---

## 1. Pre-Planning Dependency Audit

Before proposing file changes, trace the 3-layer dependency chain of the target feature:

1. **Upstream Data Source:** Where does the data or state originate? (API response, database query, global store, URL params, parent props).
2. **Transformation Layer:** How is the data validated, formatted, or computed?
3. **Downstream Consumers:** Which UI components, API endpoints, or background workers consume this output?

> **Rule:** If changing a shared interface/type breaks >2 downstream consumers, consider extending the interface (backward-compatible optional fields) rather than mutating existing fields.

---

## 2. Decomposition into Atomic Micro-Tasks

Break complex features into sequential, independently verifiable tasks ordered from **foundational contracts** to **surface integration**:

1. **Step 1: Types, Schemas & Data Contracts**
   - Define or update interfaces, types, and validation schemas first.
2. **Step 2: Pure Business Logic / State Store / Services**
   - Implement core state transitions or API handlers in isolation.
3. **Step 3: UI Components / Presentation Layer**
   - Wire the verified state/props into the visual components.
4. **Step 4: Cleanup & Edge-Case Hardening**
   - Remove dead code, unused imports, and verify boundary conditions (`null`, `undefined`, empty arrays, network timeouts).

---

## 3. Architecture Decision Checklist

When choosing between implementation approaches during `[MODE: DISCOVERY]` or `[MODE: BLUEPRINT]`:

- **Follow Existing Codebase Patterns First:** Match the project's existing folder structure, naming conventions, state management library, and styling system. Do not introduce a new library or pattern if the codebase already has a convention for it.
- **Single Responsibility:** Keep data fetching, business rules, and UI rendering cleanly separated.
- **Reversibility:** Prefer modular changes that can be cleanly reverted without cascading breakage.
