# Todo & Verification Checklist

## Agent Bootstrap Verification
- [ ] **Phase 1: Discovery**
    - [ ] `uname -a` or equivalent run to detect OS.
    - [ ] Current shell detected.
    - [ ] Agent home directory (e.g., `~/.gemini`, `~/.claude`) located.
- [ ] **Phase 2: Injection**
    - [ ] `.example` files processed and filled where necessary.
    - [ ] `personal/persistent_files/` linked/copied to agent home.
- [ ] **Phase 3: Indexing**
    - [ ] `persistent_contents.md` appended to primary instruction file (e.g., `GEMINI.md`).
    - [ ] Marker `--- From assets4agents ---` is present in the index file.
- [ ] **Final Check**
    - [ ] Agent can read `human_profile.md` from its home directory.

## Future Improvements
- [ ] Add network/proxy detection guidelines to `bootstrap.md`.
- [ ] Create more modular one-shot scripts for specific tooling (e.g., k8s, docker).
- [ ] Explore automated "Skill" installation patterns.
