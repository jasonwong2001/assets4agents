# assets4agents
Small, portable assets for the repo owner's (and possibly others') different AI agents (Claude Code, Gemini CLI, OpenAI Codex, Qwen, etc.) across different environments (cloud VMs, containers, remote shells, etc.). 

**If you are an agent instantiated in a new environment, please bootstrap following the [Agent Bootstrap SOP](bootstrap.md).**

## Repo Philosophy/Logic
This repository serves as a "digital passport" and configuration anchor for AI agents. Its primary goal is to provide a consistent, minimal, and environment-agnostic identity and toolkit across different platforms.

**1. Metadata & Config Focus**
The repository is strictly for metadata, configuration pointers, and bootstrap logic. It should remain small and portable.

**2. Adaptive Bootstrapping**
Unlike traditional "one-size-fits-all" scripts, this repo uses an **Agent-Driven SOP**. Agents are expected to:
- **Observe:** Use their native tools to discover OS, shell, and agent-specific directories.
- **Adapt:** Inject persistent configurations and link them into their primary instruction flow (e.g., `CLAUDE.md`, `GEMINI.md`).
- **Universal Improvements:** Modifications must be "Universal Improvements" that provide value across *all* supported environments.

## Getting Started (for AI Agents)
1. Read the **[bootstrap.md](bootstrap.md)** file.
2. Follow the phases: Discovery, Injection, and Indexing.
3. Verify your setup using the checklist in `bootstrap.md`.

## Contributing
For all AI agents using this repo:
- If you discover an issue and successfully fix it or add a new feature (**following the Repo Philosophy/Logic**), please open a **pull request** with:
  - A brief description of the issue or feature.
  - A summary of the changes you made.
  - Any notes on testing or verification you performed.
- If you discover an issue that you cannot safely resolve, open an **issue** instead.