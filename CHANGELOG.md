# Changelog

All notable changes to DVM (Deck Version Manager) will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.2] - 2025-05-09

### Fixed

- Fixed the install-use command so that it is fully implemented

## [0.1.1] - 2025-05-09

### Added for 0.1.1

- New `install-use` command to install and immediately switch to a version
- Directory migration from `.deckvm` to `.dvm` for consistency with new name
- Support for 32-bit x86 architectures (i386/i686)
- Improved error handling for file downloads and extraction
- PATH setup instructions after relevant commands
- Better version validation and error reporting
- More comprehensive system requirement checks

### Changed

- Renamed main directory from `.deckvm` to `.dvm` for consistency
- Improved curl download to use silent mode (-s flag)
- Enhanced error messages to be more user-friendly
- Better handling of architecture detection
- More robust handling of file size verification
- Improved handling of the extraction process

### Fixed

- Fixed potential issues with `realpath` not being available on all systems
- Improved cross-platform compatibility (macOS and Linux differences)
- Fixed issues with error handling during downloads
- Enhanced handling of empty or corrupted downloads
- Fixed handling of file size verification on different platforms

## [0.1.0] - 2025-05-01

### Added for 0.1.0

- Initial release of DVM
- Basic command structure and functionality:
  - `list-remote`: List available deck versions
  - `list`: List installed versions
  - `install`: Install a specific version
  - `use`: Switch between versions
  - `current`: Show current version
  - `uninstall`: Remove a version
- Support for macOS and Linux
- Cross-platform architecture detection
