<div align="center">

<img src="assets/logo-1024.png" alt="RZX Launcher" width="128" height="128">

# RZX Launcher

**A fast, modern Minecraft launcher with built-in server hosting.**

[**Download the latest release**](https://github.com/RegplayzOg/rzx/releases/latest)
&nbsp;·&nbsp; [**Join our Discord**](https://discord.gg/Z6KumTCFY)

</div>

Current version: **0.2.0** (2026-10-11). Windows, Linux and macOS.

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

You do not need to install Java: RZX downloads the right Java runtime for each Minecraft version. Installed copies update themselves from new releases (stable or beta channel in Settings). Windows and macOS builds are not code-signed yet, so SmartScreen or Gatekeeper may warn on first run.

## Features

**Play**
- Every Minecraft version, including snapshots and old alpha/beta, with Fabric, Quilt, Forge and NeoForge.
- Instances with groups, tags, icons, clone, backups, templates, export/import, and import from Prism, MultiMC, ATLauncher, CurseForge, the Modrinth App and the official launcher.
- Version assistant: check your mods against another game version or loader and update them with a backup first.
- Per instance: content manager with mod profiles, update checks for mods, resource packs, shaders and data packs, file browser and editor, worlds (backups, import, export, copy between instances), multiplayer server list with ping, screenshots, options editor, logs and a crash analyzer with fix buttons.
- Tuned JVM flags, Java auto-download, launch hooks, quick-play, playtime statistics.

**Discover**
- Modrinth and CurseForge search, project pages, dependency-aware installs, wishlist, install into several instances at once.
- One-click modpacks (`.mrpack` and CurseForge zip), modpack updates with a preview and revert.
- `rzx://` links open projects, instances and servers straight in the launcher.

**Accounts**
- Microsoft sign-in, offline accounts, several accounts, a default account per instance, offline play with the last saved session.
- Skin studio with a 3D preview and capes. Credentials live in Windows Credential Manager, the macOS Keychain or a private file on Linux.

**Host your own server**
- Vanilla, Paper, Purpur, Fabric, Quilt, Forge, NeoForge, or straight from a Modrinth or CurseForge modpack (server packs are used when the author provides one; client-only mods are left out).
- Live console with autocomplete, players, whitelist, operators and bans, server icon, MOTD preview, share card with your LAN and public address.
- Backups (world and full, even while running), scheduled backups and restarts, automatic restart after a crash, change software or version in place, export as zip.
- Servers keep running if the launcher closes and are picked up again when it starts.
- These servers run on your own computer and are only online while it is on. For an always-on server see [Zenix Hosting](https://zenix.sg).

**App**
- Light and dark themes, command palette (Ctrl+K), keyboard shortcuts, big screen mode with gamepad navigation, Discord Rich Presence.
- Trash with undo (7 days), storage report and cleanup, movable data folder, "What's new" page, support bundle for bug reports.
- English UI with translation tables ready for more languages (partial German sample included).

## What's new

### 0.2.0 - 2026-10-11

- Servers page shows a warning that hosted servers run on this computer and are only online while RZX and the PC are on.
- Servers: modpacks on hosted servers use the CurseForge server pack when one exists and leave client-only mods out; the result lists what was skipped.
- Servers: players tab (online players, whitelist, operators, bans), backups tab with schedules, automation (restart after a crash, scheduled restart), MOTD preview, server icon, export, share card with LAN and public address, console autocomplete and history, previous-run log.
- Servers: Purpur and Quilt software; downloads are checked against published checksums; changing software or installing a modpack is crash-safe; servers that keep running after the launcher closes are picked up again.
- Instances: trash view with undo, world backups and import/export, templates, version assistant, modpack update with preview and revert, playtime stats, storage page, "What's new" after an update, "Report a problem" support bundle, crash analyzer fix buttons, default account per instance, Discover wishlist and install into several instances, big screen mode with gamepad navigation.
- Content: update checks now cover resource packs, shaders, data packs and CurseForge files; updates install newly required dependencies.
- Global settings now apply at launch for instances that do not override them; offline grace uses the last saved session.
- Every piece of UI text now goes through translation tables; views load lazily so the app starts faster.
- Fixed: Discover kept the old category when opened from another place; shortcuts fired behind dialogs; a second confirm dialog could get lost; leaving a tab with unsaved edits now asks first; the onboarding sign-in step no longer repeats the tour; light-theme users no longer see a dark flash at start; a crash inside a background task no longer leaves it "running" forever; a corrupt saved-credentials file on Linux no longer wipes every account.
- Managed Java is re-checked once a week; "Hide launcher while playing" works; the beta update channel is honoured; `rzx://` links are registered; the data folder can be moved; the launcher waits for hosted servers to stop before exiting.

### 0.1.13 - 2026-10-10

- Servers: instance-style detail view with Overview, Console, Plugins or Mods, Worlds, Files and Settings tabs.
- Fixed plugin and mod search on hosted servers (Paper servers only show plugins, mod servers only their loader's mods).
- Change a server's software or Minecraft version, or apply a modpack to an existing server; worlds are kept and old content is moved to the server's backups folder.
- Added a hosting banner pointing to Zenix for always-on servers.

### 0.1.12 - 2026-10-10

- New Servers section: host Vanilla, Paper, Fabric, Forge and NeoForge servers locally, or create one from a Modrinth or CurseForge modpack.
- Installer scripts for macOS and Windows in addition to the Linux script.

### 0.1.11 - 2026-10-10

- Java 21 and newer now start with G1 instead of ZGC: 28 to 40 percent less memory and faster loading on Java 25 in our measurements.
- Welcome tour and sign-in dialog can play offline.

## Community

Questions, bug reports, feedback or just want to chat? Join the official RZX Discord: **https://discord.gg/Z6KumTCFY**

## About

RZX is closed source and developed by **Regplayz**. This repository only hosts the downloads and release notes.
