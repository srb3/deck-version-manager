# DVM Usage Guide

This document provides detailed information on how to use DVM (Deck Version
Manager) to manage Kong's Deck CLI tool.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Basic Commands](#basic-commands)
- [Advanced Usage](#advanced-usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before using DVM, ensure you have the following tools installed:

- `bash` (version 4.0 or higher)
- `curl` (for downloading releases)
- `tar` (for extracting archives)
- `grep` (for parsing output)
- `gunzip` (for extracting archives)
- `file` (for verifying files)

## Installation

### Quick Installation (Recommended)

```bash
curl -s https://raw.githubusercontent.com/KongHQ-CX/deck-version-manager/main/install.sh | bash
```

Then add DVM to your PATH:

```bash
echo 'export PATH="$HOME/.dvm/bin:$PATH"' >> ~/.bashrc
# Or for Zsh users
echo 'export PATH="$HOME/.dvm/bin:$PATH"' >> ~/.zshrc
```

### Manual Installation

If you prefer a manual installation:

1. Clone the repository:

   ```bash
   git clone https://github.com/KongHQ-CX/deck-version-manager.git
   ```

2. Make the script executable:

   ```bash
   chmod +x dvm/dvm
   ```

3. Add it to your PATH either by copying or symlinking:

   ```bash
   # Option 1: Copy to a location in your PATH
   cp dvm/dvm /usr/local/bin/dvm
   
   # Option 2: Create a symlink
   ln -sf "$(pwd)/dvm/dvm" /usr/local/bin/dvm
   ```

## Basic Commands

### List Available Versions

To see what versions of Deck are available for installation:

```bash
dvm list-remote
```

By default, this shows only the first page of results. To fetch more pages:

```bash
dvm list-remote 3  # Fetches 3 pages of results
```

### List Installed Versions

To see what versions you have installed locally:

```bash
dvm list
```

This will show all installed versions, with the current active version marked.

### Install a Version

To install a specific version:

```bash
dvm install v1.46.3
```

You can omit the 'v' prefix if you prefer:

```bash
dvm install 1.46.3
```

### Install and Use a Version

To install a version and immediately set it as the current version:

```bash
dvm install-use v1.46.3
```

### Switch Versions

To switch between installed versions:

```bash
dvm use v1.46.3
```

### Check Current Version

To see which version is currently active:

```bash
dvm current
```

This will also show the output of `deck version` to confirm it's working correctly.

### Uninstall a Version

To remove a version that you no longer need:

```bash
dvm uninstall v1.46.3
```

Note: You cannot uninstall the currently active version. Switch to another
version first.

## Advanced Usage

### Migrating from `.deckvm` to `.dvm`

If you were using a previous version of this tool that stored files in
`~/.deckvm`, DVM will automatically detect this and migrate your settings and
installed versions to the new `~/.dvm` directory.

### Shell Completion

DVM comes with shell completion scripts for `Bash` and `Zsh`. To enable them:

For `Bash`:

```bash
source ~/.dvm/completions/dvm.bash
# Add to your ~/.bashrc for permanent use
```

For `Zsh`:

```bash
source ~/.dvm/completions/dvm.zsh
# Add to your ~/.zshrc for permanent use
```

## Configuration

DVM stores all its files in the `~/.dvm` directory:

- `~/.dvm/versions/` - Contains installed versions
- `~/.dvm/bin/` - Contains symlinks to the active version
- `~/.dvm/current` - Contains the name of the current version

## Troubleshooting

### Command Not Found

If you get a "command not found" error when running `dvm`, ensure:

1. The installation completed successfully
2. You've added `~/.dvm/bin` to your PATH
3. You've reloaded your shell (or opened a new terminal)

### Installation Fails

If installation fails, check:

1. You have all the required tools installed
2. You have write permissions to the `~/.dvm` directory
3. Your internet connection is working

For download issues, check if you can access GitHub from your network.

### Version Not Found

If a version you're trying to install isn't found:

1. Check that you spelled the version correctly
2. Try using `dvm list-remote` to see available versions
3. The version might be very new or old (try fetching more pages with
`dvm list-remote 5`)

### File Size Warning

If you see a warning about downloaded file size:

1. This usually means the download was incomplete or failed
2. Check your internet connection
3. Try the installation again
