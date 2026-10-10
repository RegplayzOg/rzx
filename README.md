<div align="center">

<img src="assets/logo-1024.png" alt="RZX Launcher" width="128" height="128">

# RZX Launcher

**A fast, modern Minecraft launcher.**

[**Download the latest release**](https://github.com/RegplayzOg/rzx/releases/latest)
&nbsp;·&nbsp; [**Join our Discord**](https://discord.gg/Z6KumTCFY)

</div>

## Download

Grab the file for your system from the [latest release](https://github.com/RegplayzOg/rzx/releases/latest):

| System | File |
|---|---|
| Windows | `RZX_<version>_x64-setup.exe` (installer) or `.msi` |
| Linux | `.AppImage`, `.deb` or `.rpm` |
| macOS | `.dmg` (Apple Silicon: `aarch64`, Intel: `x64`) |

### One-line install

**Windows** (PowerShell): downloads and runs the latest installer.

```powershell
irm https://raw.githubusercontent.com/RegplayzOg/rzx/main/install.ps1 | iex
```

**macOS and Linux** (Terminal): no root needed. On macOS it installs RZX into `~/Applications`; on Linux (any x86_64 distro) it installs the AppImage, an app-menu entry and an `rzx` command.

```sh
curl -fsSL https://raw.githubusercontent.com/RegplayzOg/rzx/main/install.sh | sh
```

To remove it on macOS or Linux (your instances in `~/.rzx` are kept):

```sh
curl -fsSL https://raw.githubusercontent.com/RegplayzOg/rzx/main/install.sh | sh -s -- --uninstall
```

On Windows, uninstall from Settings > Apps.

RZX updates itself: once installed, it checks this page for new releases and installs them from inside the app.

## Features

- Every Minecraft version, including snapshots, with Fabric, Quilt, Forge and NeoForge.
- Modrinth and CurseForge browsing, mod and modpack installs, and instance backups.
- Microsoft sign-in, offline accounts and a 3D skin preview.
- Worlds, servers, screenshots and logs per instance, with Discord Rich Presence.

## Community

Questions, bug reports, feedback or just want to chat? Join the official RZX Discord: **https://discord.gg/Z6KumTCFY**

## About

RZX is closed source. This repository only hosts the downloads and release notes.
