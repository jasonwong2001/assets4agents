# Agent Bootstrap SOP

This document serves as an actionable Standard Operating Procedure (SOP) for an AI agent to bootstrap its identity and toolkit in a new environment. **Follow these steps precisely to ensure a consistent and robust setup.**

## Phase 1: Environment Discovery

Perform a discovery phase to map the current system constraints and agent-specific markers.

1.  **Identify OS & Shell:** Determine the operating system and current shell (e.g., bash, zsh).
2.  **Detect Agent Home:** Search for the agent's primary configuration directory in order of preference:
    -   `~/.claude`
    -   `~/.gemini`
    -   `~/.codex`
    -   `~/.qwen`
    -   Any environment variable explicitly defining an agent's workspace.
3.  **Handle Multiple Homes:** If multiple directories exist, prioritize the one corresponding to your current instantiation (e.g., if you are Gemini CLI, use `~/.gemini`). If ambiguous, ask the human or use the most recently modified one.

## Phase 2: Mandatory Asset Injection

Ensure your "digital passport" is available in the detected Agent Home.

1.  **Secret Seeding (One-Shot):**
    -   Identify all `.example` files in `personal/oneshot_files/` and `personal/persistent_files/`.
    -   If the corresponding non-example file (e.g., `api_keys.sh` for `api_keys.sh.example`) does not exist, create it by copying the template.
    -   **Important:** If a file requires manual secrets (like API keys), prompt the human to fill them before proceeding.
2.  **Symlink/Copy Persistent Files:**
    -   For every non-example file in `personal/persistent_files/`, create a symlink (or copy if symlinks are not supported) in the detected **Agent Home**.
    -   Ensure filenames are preserved (e.g., `personal/persistent_files/human_profile.md` -> `~/.gemini/human_profile.md`).

## Phase 3: Automated Indexing

Link the injected assets into your primary instruction flow.

1.  **Identify Index File:** Locate the primary instruction file in your Agent Home (e.g., `CLAUDE.md`, `GEMINI.md`, or `README.md`).
2.  **Inject persistent_contents.md:**
    -   Check if the file already contains the marker `--- From assets4agents ---`.
    -   If not, append the marker followed by the contents of `personal/persistent_contents.md` to the end of your index file.
3.  **Self-Verify:** Confirm that you can now read the persistent files (like `human_profile.md`) directly from your home directory.

## Phase 4: Quality of Life (Optional)

1.  **Tmux Configuration:** If `tmux` is available, check `~/.tmux.conf`. If not already present, suggest or append the following for better scrolling and history:
    ```shell
    set -g mouse on
    set -g history-limit 200000
    ```
2.  **Skill Installation:** Check if the human wants to install relevant agent skills (e.g., `superpower`).

---

## Completion Checklist
- [ ] Agent Home detected and verified.
- [ ] All `personal/persistent_files/` linked to Home.
- [ ] Secrets seeded from templates (if any).
- [ ] `persistent_contents.md` injected into the primary instruction file.
- [ ] Tmux settings suggested/applied.