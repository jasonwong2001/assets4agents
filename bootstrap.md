# Bootstrap

If you are an agent instantiated in a new environment, follow these steps to set up your context and tools.

## Recommended (Automated)
Run the setup script and follow the prompts:
```bash
./setup.sh
```

## Manual Steps (Alternative)
- Copy and fill in any `.example` files in `./personal/oneshot_files/` and `./personal/persistent_files/`.
- Run the filled-in scripts in `./personal/oneshot_files/`.
- Copy relevant config files from `./personal/persistent_files/` to your agent-specific directory (e.g., `~/.claude/`, `~/.gemini/`, `~/.codex/`, `~/.qwen/`, etc.).
- Add index for the config files in the agent specific file (e.g., `CLAUDE.md`, `GEMINI.md`, `README.md`).
- Add `persistent_contents.md` to your agent-specific instruction file.

## Checklist
Ask your human weather they want to enforce the following setting.
### Help Your Human Learn What You Did

Most humans will run you inside `tmux`. The settings below provide a significant quality-of-life improvement: they enable mouse-based scrolling in `tmux` and preserve a much larger command history.

```shell
# ~/.tmux.conf
set -g mouse on
set -g history-limit 200000
```
then
```shell
tmux source-file ~/.tmux.conf
```

### Suggest Installing Skills
- superpower

### Setup Ollama server tunnel

### Other Optional Items
