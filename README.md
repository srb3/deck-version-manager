# DVM - Deck Version Manager

A simple version manager for
[Kong's Deck](https://github.com/Kong/deck), inspired by RVM.

DVM allows you to easily install, manage, and switch between different versions
of the Kong Deck CLI tool.

DVM allows you to:

- Install multiple versions of Deck
- Switch between installed versions
- List locally installed and remotely available versions
- Automatically detects your OS and architecture
- Supports macOS and Linux

## Installation

### Quick Install

```bash
# Install DVM
curl -s https://raw.githubusercontent.com/KongHQ-CX/deck-version-manager/main/install.sh | bash

# Add DVM to your PATH (add this to your .bashrc, .zshrc, etc.)
export PATH="$HOME/.dvm/bin:$PATH"
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/KongHQ-CX/deck-version-manager.git

# Copy the script to a location in your PATH
cp dvm/dvm /usr/local/bin/dvm
# OR make a symlink
ln -sf "$(pwd)/dvm/dvm" /usr/local/bin/dvm

# Make it executable
chmod +x /usr/local/bin/dvm
```

## Usage

```bash
# List available deck versions
dvm list-remote

# List installed versions
dvm list

# Install a specific version
dvm install v1.46.3

# Install and immediately switch to a version
dvm install-use v1.46.3

# Switch to an installed version
dvm use v1.46.3

# Display current version
dvm current

# Uninstall a version
dvm uninstall v1.46.3
```

For detailed usage information, run `dvm help` or see the [Usage Guide](docs/USAGE.md).

## Shell Completion

DVM provides shell completion scripts for `Bash` and `Zsh`. To enable them:

### `Bash`

```bash
source /path/to/dvm/completions/dvm.bash
# Or add to your ~/.bashrc
```

### `Zsh`

```bash
source /path/to/dvm/completions/dvm.zsh
# Or add to your ~/.zshrc
```

## Requirements

- `bash` 4.0+
- `curl`
- `tar`
- `grep`
- `gunzip`
- `file`

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

For major changes, please open an issue first to discuss what you would like to
change. See [Contributing Guidelines](docs/CONTRIBUTING.md) for more information.
