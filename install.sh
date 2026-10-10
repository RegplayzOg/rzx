#!/bin/sh
# RZX installer for Linux (x86_64, any distro) and macOS (Apple Silicon and Intel).
#   curl -fsSL https://raw.githubusercontent.com/RegplayzOg/rzx/main/install.sh | sh
#   sh install.sh --uninstall        remove RZX (your instances in ~/.rzx are kept)
#   sh install.sh --version 0.1.11   install a specific version
# Installs into your home folder (no root needed); on macOS into ~/Applications. RZX updates itself from inside the app.
set -eu

REPO="RegplayzOg/rzx"
DATA="${XDG_DATA_HOME:-$HOME/.local/share}"
BIN="$HOME/.local/bin"
DIR="$DATA/rzx"
APPIMAGE="$DIR/RZX.AppImage"
ICON="$DIR/rzx.png"
DESKTOP="$DATA/applications/rzx.desktop"

say() { printf '%s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

fetch() { # fetch <url> <output>
  if command -v curl >/dev/null 2>&1; then curl -fsSL --retry 3 -o "$2" "$1"
  elif command -v wget >/dev/null 2>&1; then wget -q -O "$2" "$1"
  else die "curl or wget is required"; fi
}

uninstall() {
  if [ "$(uname -s)" = "Darwin" ]; then
    rm -rf "$HOME/Applications/RZX.app"
    say "RZX removed. Your instances and settings in ~/.rzx were kept."
    exit 0
  fi
  rm -f "$BIN/rzx" "$DESKTOP"
  rm -rf "$DIR"
  command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$DATA/applications" 2>/dev/null || true
  say "RZX removed. Your instances and settings in ~/.rzx were kept."
  exit 0
}

VERSION=""
while [ $# -gt 0 ]; do
  case "$1" in
    --uninstall) uninstall ;;
    --version) [ $# -ge 2 ] || die "--version needs a value"; VERSION="${2#v}"; shift ;;
    -h|--help) sed -n '2,6p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) die "unknown option: $1" ;;
  esac
  shift
done

OS="$(uname -s)"
case "$OS" in Linux|Darwin) ;; *) die "this installer is for Linux and macOS (on Windows use install.ps1)" ;; esac
if [ "$OS" = "Linux" ]; then
  case "$(uname -m)" in
    x86_64|amd64) ;;
    *) die "only x86_64 builds are available (this machine is $(uname -m))" ;;
  esac
fi

if [ -z "$VERSION" ]; then
  say "Looking up the latest version..."
  if command -v curl >/dev/null 2>&1; then
    final="$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest")"
  else
    final="$(wget -q --spider -S "https://github.com/$REPO/releases/latest" 2>&1 | sed -n 's/^ *[Ll]ocation: *//p' | tail -n 1 | tr -d '\r')"
  fi
  VERSION="${final##*/v}"
  case "$VERSION" in ""|*/*|*" "*) die "could not work out the latest version" ;; esac
fi

if [ "$OS" = "Darwin" ]; then
  case "$(uname -m)" in arm64) ARCH=aarch64 ;; *) ARCH=x64 ;; esac
  URL="https://github.com/$REPO/releases/download/v$VERSION/RZX_$ARCH.app.tar.gz"
  say "Downloading RZX $VERSION..."
  work="$(mktemp -d)"
  trap 'rm -rf "$work"' EXIT
  fetch "$URL" "$work/rzx.tar.gz" || die "download failed ($URL)"
  tar -xzf "$work/rzx.tar.gz" -C "$work"
  [ -d "$work/RZX.app" ] || die "the download did not contain RZX.app"
  mkdir -p "$HOME/Applications"
  rm -rf "$HOME/Applications/RZX.app"
  mv "$work/RZX.app" "$HOME/Applications/RZX.app"
  xattr -dr com.apple.quarantine "$HOME/Applications/RZX.app" 2>/dev/null || true
  say "RZX $VERSION installed in ~/Applications. Open it from Launchpad or Spotlight."
  exit 0
fi

URL="https://github.com/$REPO/releases/download/v$VERSION/RZX_${VERSION}_amd64.AppImage"
say "Downloading RZX $VERSION..."
mkdir -p "$DIR" "$BIN" "$DATA/applications"
fetch "$URL" "$APPIMAGE.part" || { rm -f "$APPIMAGE.part"; die "download failed ($URL)"; }
chmod +x "$APPIMAGE.part"
mv -f "$APPIMAGE.part" "$APPIMAGE"
fetch "https://raw.githubusercontent.com/$REPO/main/assets/logo-1024.png" "$ICON" 2>/dev/null || rm -f "$ICON"

# Launcher: AppImages need FUSE 2; without it, fall back to extracting on each start.
cat > "$BIN/rzx" <<WRAP
#!/bin/sh
if [ ! -e /dev/fuse ] || ! { ldconfig -p 2>/dev/null || /sbin/ldconfig -p 2>/dev/null; } | grep -q 'libfuse.so.2'; then
  export APPIMAGE_EXTRACT_AND_RUN=1
fi
exec "$APPIMAGE" "\$@"
WRAP
chmod +x "$BIN/rzx"

cat > "$DESKTOP" <<ENTRY
[Desktop Entry]
Type=Application
Name=RZX
Comment=Fast, modern Minecraft launcher
Exec=$BIN/rzx
Icon=$([ -f "$ICON" ] && printf '%s' "$ICON" || printf 'applications-games')
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;mods;
StartupWMClass=rzx-desktop
ENTRY
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$DATA/applications" 2>/dev/null || true

say "RZX $VERSION installed. Open it from your app menu, or run: rzx"
case ":$PATH:" in *":$BIN:"*) ;; *) say "Note: $BIN is not on your PATH; add it to run 'rzx' from a terminal." ;; esac
