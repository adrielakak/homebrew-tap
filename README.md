# adrielakak/homebrew-tap

Homebrew tap for [GravityNotch](https://adrielakak.github.io/GravityNotch/), a Dynamic Island style control center for the MacBook notch.

## Install

```bash
brew install --cask adrielakak/tap/gravitynotch
```

Or tap first, then install:

```bash
brew tap adrielakak/tap
brew install --cask gravitynotch
```

GravityNotch is not notarized by Apple. If macOS blocks the first launch, open
**System Settings > Privacy & Security** and click **Open Anyway**, or run:

```bash
xattr -cr /Applications/GravityNotch.app
```

## Update

GravityNotch updates itself through Sparkle. You can also run:

```bash
brew upgrade --cask gravitynotch
```

## Uninstall

```bash
brew uninstall --cask gravitynotch
# remove settings and caches too
brew uninstall --zap --cask gravitynotch
```

## Casks

| Cask | App | Source |
| --- | --- | --- |
| `gravitynotch` | GravityNotch | [adrielakak/GravityNotch](https://github.com/adrielakak/GravityNotch) |
