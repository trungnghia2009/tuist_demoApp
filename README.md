# Tuist Demo App

This repository demonstrates how to set up and manage an iOS project using **Tuist**, including:

- Project generation
- Environment-based schemes (Dev / QA / Prod)
- SwiftUI
- LaunchScreen configuration
- Tool version management with **mise**

---

## 📦 Requirements

- macOS
- Xcode (latest stable recommended)
- Git

---

## 🛠 Tooling

This project uses:

- **Tuist** – Xcode project generation
- **mise** – tool version manager to pin tool versions

All required versions are defined in `mise.toml`.

---

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone https://github.com/trungnghia2009/tuist_demoApp.git
cd tuist_demoApp
```

---

### 2️⃣ Install mise

```bash
curl https://mise.run | sh
```

Activate mise (zsh):

```bash
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
source ~/.zshrc
```

Verify:

```bash
mise --version
```

---

### 3️⃣ Trust project config

```bash
mise trust
```

This is required once for security reasons.

---

### 4️⃣ Install tools (Tuist)

```bash
mise install
```

Verify Tuist:

```bash
tuist version
```

---

### 5️⃣ Generate Xcode project

```bash
tuist generate
```

---

### 6️⃣ Open project

```bash
open DemoApp.xcodeproj
```

---

## 🧱 Project Structure

```text
.
DemoApp Project
│
├── 📦 External Dependencies
│   ├── Remote Package: Alamofire (v5.11.0)
│   └── Local Package: UIComponents (SwiftPackages/UIComponents)
│
├── ⚙️ Configurations (6)
│   ├── Debug-Dev (Configs/Dev.xcconfig)
│   ├── Release-Dev (Configs/Dev.xcconfig)
│   ├── Debug-QA (Configs/QA.xcconfig)
│   ├── Release-QA (Configs/QA.xcconfig)
│   ├── Debug-Prod (Configs/Prod.xcconfig)
│   └── Release-Prod (Configs/Prod.xcconfig)
│
├── 🎯 Schemes (6)
│   ├── Debug-Dev → Debug-Dev
│   ├── Release-Dev → Release-Dev
│   ├── Debug-QA → Debug-QA
│   ├── Release-QA → Release-QA
│   ├── Debug-Prod → Debug-Prod
│   └── Release-Prod → Release-Prod
│
└── 🎯 Targets (2)
    │
    ├── DemoApp (Main App)
    │   ├── Product: iOS App
    │   ├── Bundle ID: $(PRODUCT_BUNDLE_IDENTIFIER)
    │   ├── iOS Target: 16.0+
    │   ├── Version: 0.1.0 (Build 1)
    │   │
    │   ├── 📁 Sources
    │   │   └── DemoApp/Sources/
    │   │
    │   ├── 📁 Resources
    │   │   └── DemoApp/Resources/
    │   │
    │   └── 🔗 Dependencies
    │       ├── Alamofire
    │       └── UIComponents
    │
    └── DemoAppTests (Unit Tests)
        ├── Product: Unit Tests
        ├── Bundle ID: dev.tuist.DemoAppTests
        │
        ├── 📁 Test Sources
        │   └── DemoApp/Tests/
        │
        └── 🔗 Dependencies
            └── DemoApp (test target)
```

---

## 🌱 Schemes & Environments

| Scheme        | Configuration | Environment |
|--------------|--------------|-------------|
| Debug-Dev  | Debug-Dev    | Development |
| Release-Dev   | Release-Dev     | Development |
| Debug-QA | Debug-QA | Quality |
| Release-QA | Release-QA | Quality |
| Debug-Prod | Debug-Prod | Production |
| Release-Prod | Release-Prod | Production |

---

## 🎨 Launch Screen

- Implemented using `LaunchScreen.storyboard` in `DemoApp/Resources/`
- Declared via `UILaunchStoryboardName`
- Must have **Is Initial View Controller** enabled

---

## 🧹 Clean

```bash
tuist clean
tuist generate
```

---

## 📚 References

- [Installing mise and Setting Up Tuist on macOS](mise-tuist-setup-en.md)
- [Tuist document](https://docs.tuist.io)
- [mise](https://mise.jdx.dev)

---

## 🧠 Philosophy

Declarative projects. Reproducible builds. Fewer Xcode issues.
