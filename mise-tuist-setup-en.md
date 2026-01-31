# Complete Guide: Installing mise and Setting Up Tuist on macOS

## Goals
- Install `mise` correctly on macOS
- Properly activate mise in your shell
- Install and manage **Tuist** using mise
- Avoid common permission and PATH issues
- Suitable for iOS / mobile development and team environments

---

## 1. Install mise

### Recommended: Using Homebrew
```bash
brew install mise
```

Verify installation:
```bash
mise --version
```

---

## 2. Activate mise in your shell (REQUIRED)

> Skipping this step will cause `mise doctor` errors and `tuist` will not be found.

### For zsh (default on macOS)
```bash
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
echo 'export PATH="$HOME/.local/share/mise/shims:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Verify:
```bash
mise doctor
```

Expected output:
```
✔ mise is activated
```

---

## 3. Fix permission issues (if any)

If you see errors like:
```
Permission denied: ~/.local/state/mise/...
```

Run:
```bash
sudo chown -R $(whoami) ~/.local
```

> ⚠️ Never run `sudo mise ...`

---

## 4. Install Tuist using mise

### List all available Tuist versions
```bash
mise ls-remote tuist
```

### Install the latest Tuist version
```bash
mise install tuist@latest
```

### Use Tuist globally
```bash
mise use -g tuist@latest
```

Verify:
```bash
which tuist
tuist version
```

Expected result:
```
~/.local/share/mise/shims/tuist
4.x.x
```

---

## 5. Pin Tuist per project (recommended for teams)

Inside your project directory:
```bash
mise use tuist@4.133.4
```

This creates a `.mise.toml` file.  
👉 Commit this file so the whole team uses the same Tuist version automatically.

---

## 6. Common mise + Tuist commands

```bash
mise current tuist     # show current Tuist version
mise ls tuist          # list installed Tuist versions
mise uninstall tuist@4.120.0
```

---

## 7. Best practices

### DO
- Use mise to manage Tuist, Node, Ruby, etc.
- Pin tool versions with `.mise.toml`
- Commit `.mise.toml` to your repository

### DON’T
- Use `tuistenv` and mise at the same time
- Install Tuist via Homebrew when using mise
- Run mise commands with sudo

---

## 8. Recommended setup for iOS developers

```bash
mise install node@lts
mise install ruby@3.3
mise use -g node@lts
mise use -g ruby@3.3
mise use -g tuist@latest
```

This setup works well with:
- Tuist
- CocoaPods
- Fastlane
- React Native / Expo

---

## Final checklist
- [ ] `mise doctor` passes
- [ ] `which tuist` points to mise shims
- [ ] `tuist version` works
- [ ] No `tuistenv` installed

---

Happy coding 🚀
