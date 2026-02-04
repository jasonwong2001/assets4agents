Agents should use a dedicated Bot Account to interact with GitHub without risking the primary account of their human.

## Workflow
- The agent **Forks** the target repository to the bot's account.
- The agent pushes changes (respecting the repository's philosophy/logic) to a branch on the **Fork**.
- The agent opens a **Pull Request** from the fork back to the original repository using the GitHub API (e.g., via `curl`).