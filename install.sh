#!/bin/bash

set -e

TARGET_DIR="$HOME/.local/bin"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION_FILE="version.json"
SCRIPT_FILE="winebrew"

# === Logging helpers ===
info()  { echo -e "\e[32m[install] INFO:\e[0m $*"; }
warn()  { echo -e "\e[33m[install] WARNING:\e[0m $*"; }
error() { echo -e "\e[31m[install] ERROR:\e[0m $*"; }

# === Distro package installer ===
install_package() {
    local pkg="$1"
    if command -v pacman &>/dev/null; then
        info "Detected Arch Linux. Installing $pkg via pacman..."
        sudo pacman -Sy --noconfirm "$pkg"
    elif command -v apt &>/dev/null; then
        info "Detected Debian/Ubuntu. Installing $pkg via apt..."
        sudo apt update && sudo apt install -y "$pkg"
    elif command -v dnf &>/dev/null; then
        info "Detected Fedora/RHEL. Installing $pkg via dnf..."
        sudo dnf install -y "$pkg"
    elif command -v zypper &>/dev/null; then
        info "Detected openSUSE. Installing $pkg via zypper..."
        sudo zypper install -y "$pkg"
    else
        error "Unsupported distro. Please install '$pkg' manually."
        return 1
    fi
}

# === Ensure required tools ===
require_dependencies() {
    for dep in jq unzip; do
        if ! command -v "$dep" &> /dev/null; then
            warn "'$dep' is not installed. Attempting to install..."
            install_package "$dep" || {
                error "Could not install required dependency: $dep"
                exit 1
            }
        fi
    done
}

# === Begin installation ===
info "Installing winebrew..."

mkdir -p "$TARGET_DIR"

cp "$REPO_DIR/$SCRIPT_FILE" "$TARGET_DIR/winebrew"
chmod +x "$TARGET_DIR/winebrew"

cp "$REPO_DIR/$VERSION_FILE" "$TARGET_DIR/version.json"

info "winebrew copied to $TARGET_DIR"

require_dependencies

# === Run initial setup steps ===
"$TARGET_DIR/winebrew" --fix-prefix
"$TARGET_DIR/winebrew" --install-storybrew
"$TARGET_DIR/winebrew" --install-desktop

info "winebrew installation complete."
echo "You can now run it using: winebrew"
echo "Or find it in your application launcher as 'Storybrew Editor'"
