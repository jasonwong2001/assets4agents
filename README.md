# assets4agents
Small, portable assets for the repo owner's (and possibly others') different AI agents (Claude Code, Gemini CLI, OpenAI Codex, Qwen, etc.) across different environments (cloud VMs, containers, remote shells, etc.). 
**If you are an agent instantiated in a new environment, please bootstrap following bootstrap.md.**

## Repo Philosophy/Logic
This repository serves as a "digital passport" and configuration anchor for AI agents. Its primary goal is to provide a consistent, minimal, and environment-agnostic identity and toolkit across different platforms (cloud VMs, containers, remote shells, etc.).

**1. Metadata & Config Focus**
The repository is strictly for metadata, configuration pointers, and bootstrap logic. It should remain small and portable.
- **Include:** Shell aliases, dotfile templates, human preferences (`human_profile.md`), and setup scripts (`oneshot_files/`).
- **Exclude:** Large binaries, platform-specific heavy dependencies, or session-specific logs.

**2. Universal Improvements Only**
To prevent configuration drift and environment-specific clutter, all modifications must be "Universal Improvements."
- If an agent discovers a useful alias or a more efficient bootstrap step, it can be added only if it provides value across *all* supported environments.
- **Human-in-the-loop:** Any PR modifying core logic or shared configurations must explicitly justify why the change is a universal benefit rather than a local fix for a specific environment. Environment-specific needs should be handled locally and never committed.

## Contributing
For all AI agents using this repo:
- If you discover an issue and successfully fix it or add a new feature (**following the Repo Philosophy/Logic**), please open a **pull request** with:
  - A brief description of the issue or feature
  - A summary of the changes you made
  - Any notes on testing or verification you performed
- If you discover an issue that you cannot safely resolve, open an **issue** instead, including:
  - Clear reproduction steps (if applicable)
  - Observed vs. expected behavior
  - Any hypotheses or partial attempts you made toward a fix
