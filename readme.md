# winebrew

A Wine-based launcher and installer script for [Storybrew](https://github.com/damnae/storybrew) on Linux.

This script sets up a clean 32-bit Wine prefix, installs the required .NET Desktop Runtime and SDK, downloads Storybrew, and adds a desktop shortcut with proper icon support.

## Features

- Auto-installs Storybrew to `~/.local/share/sbrew`
- Creates an isolated 32-bit Wine prefix just for Storybrew
- Installs .NET Desktop Runtime 8.0.8 (x86) and SDK 8.0.408
- VSCode passthrough integration (so you can edit scripts from inside Storybrew)
- Adds a desktop entry with the official Storybrew icon
- Self-updating with `--update` support

## Installation

Clone the repository and run the install script:

```
git clone https://github.com/maotovisk/winebrew.git
cd winebrew
chmod +x install.sh
./install.sh
```

This will install everything and set it up for you.

## Usage

Once installed, you can launch Storybrew from your applications menu (look for “Storybrew Editor”) or run:

```
winebrew
```

## Commands

```
winebrew [option]
```

Available options:

- `--fix-prefix`        Recreate Wine prefix and reinstall .NET
- `--install-storybrew` (Re)download Storybrew to the correct folder
- `--setup-vscode`      Recreate the VSCode passthrough script
- `--install-desktop`   Create a desktop entry for launching
- `--debug`             Print installed .NET runtimes in the prefix
- `--update`            Check for updates to the script

## Requirements

- Wine (32-bit support required - some distributions ship with 64-bit only)
- `jq` and `icoutils` (the install script will try to install them automatically)
- `git` (for downloading Storybrew)
- `curl` (for downloading the .NET runtimes)
- `unzip` (for extracting the Storybrew zip)
- `xdg-utils` (for creating the desktop entry)
- `visual-studio-code-bin` or `code` (for the passthrough script)

## Notes

- The Wine prefix is stored at `~/.sbrewprefix`
- The app files live in `~/.local/share/sbrew`
- The launch script is located at `~/.local/bin/winebrew`
- The desktop entry goes to `~/.local/share/applications`

---

Feel free to open an issue if something doesn't work on your setup.
