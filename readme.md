# winebrew

A Wine-based launcher and installer script for [Storybrew](https://github.com/damnae/storybrew) on Linux.

This script sets up a clean Wine prefix, installs the required .NET Desktop Runtime and SDK, downloads Storybrew, installs wine-osu from Nello's WineBuilder, and adds a desktop shortcut with proper icon support.

## Features

- Auto-installs Storybrew to `~/.local/share/sbrew`
- Creates an isolated Wine prefix just for Storybrew
- Runs on WineWoW64 (64-bit Wine prefix with 32-bit support)
- Installs .NET Desktop Runtime 8.0.8 (x86) and SDK 8.0.408
- Installs and updates wine-osu from [NelloKudo](https://github.com/NelloKudo)'s [WineBuilder](https://github.com/NelloKudo/WineBuilder) repository, same powering osu-winello.
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

This will install everything and set it up for you, including downloading and installing wine-osu.

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

- `--help`              Display help information
- `--fix-prefix`        Recreate Wine prefix and reinstall .NET
- `--install-storybrew` (Re)download Storybrew to the correct folder
- `--setup-vscode`      Recreate the VSCode passthrough script
- `--install-desktop`   Create a desktop entry for launching
- `--debug`             Print installed .NET runtimes in the prefix
- `--update`            Check for updates to the script and wine-osu
- `--update-wine-osu`   Check for and install updates to wine-osu only

## Requirements

- Wine (32-bit support required - some distributions ship with 64-bit only)
- `jq` and `icoutils` (the install script will try to install them automatically)
- `git` (for downloading Storybrew)
- `curl` or `wget` (for downloading the .NET runtimes and wine-osu)
- `unzip` (for extracting the Storybrew zip)
- `xdg-utils` (for creating the desktop entry)
- `visual-studio-code-bin` or `code` (for the passthrough script)

## Notes

- The Wine prefix is stored at `~/.sbrewprefix`
- The app files live in `~/.local/share/sbrew`
- The wine-osu files live in `~/.local/share/winebrew/wine-osu`
- The launch script is located at `~/.local/bin/winebrew`
- The desktop entry goes to `~/.local/share/applications`
- Special thanks to [NelloKudo](https://github.com/NelloKudo) for the wine-osu builds and [damnae](https://github.com/damnae) for Storybrew.

---

Feel free to open an issue if something doesn't work on your setup.
