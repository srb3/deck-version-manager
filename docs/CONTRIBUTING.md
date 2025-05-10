# Contributing to DVM

Thank you for considering contributing to DVM! This document provides guidelines and instructions for contributing to this project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Documentation](#documentation)

## Code of Conduct

Please be respectful and considerate of others when contributing to this
project. We aim to foster an inclusive and welcoming community.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** to your local machine

   ```bash
   git clone https://github.com/KongHQ-CX/deck-version-manager.git
   cd dvm
   ```

3. **Add the upstream remote**

   ```bash
   git remote add upstream https://github.com/KongHQ-CX/deck-version-manager.git
   ```

4. **Create a new branch** for your feature or `bugfix`

   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

1. **Make your changes** in your feature branch
2. **Test your changes** (see [Testing](#testing) section)
3. **Commit your changes** with a clear commit message

   ```bash
   git commit -m "Add feature: description of your feature"
   ```

4. **Push to your fork**

   ```bash
   git push origin feature/your-feature-name
   ```

5. **Submit a pull request** from your fork to the original repository

## Pull Request Process

1. **Update the README.md or documentation** with details of changes if appropriate
2. **Update the CHANGELOG.md** with details of changes
3. **Ensure your code follows the coding standards** (see [Coding Standards](#coding-standards))
4. **Wait for reviews** and respond to any feedback

## Coding Standards

When contributing to DVM, please follow these coding standards:

1. **Shell scripts**:
   - Use 2-space indentation
   - Follow
   [Google's `Shell Style Guide`](https://google.github.io/styleguide/shellguide.html)
   where applicable
   - Add comments for non-obvious code sections
   - Use lowercase for variable names
   - Use ALL_CAPS for constants

2. **Documentation**:
   - Use `markdown` for all documentation
   - Keep line length reasonable (80 to 100 characters)
   - Include examples where appropriate

## Testing

Before submitting your changes, please test them thoroughly:

1. **Manual testing**:
   - Test all affected commands
   - Test on multiple platforms if possible (at least Linux and macOS)
   - Test with different versions of Deck

2. **Automated testing** (if available):

   ```bash
   # Run the test suite
   ./test/test_dvm.sh
   ```

## Documentation

If you add new features or make significant changes, please update the documentation:

1. **Update the usage guide** in `docs/USAGE.md`
2. **Update the README.md** if necessary
3. **Update the help command output** in the main script

## Feature Requests and Bug Reports

If you have ideas for new features or have found a bug, please submit an issue on GitHub. Please include:

- A clear title and description
- As much relevant information as possible
- A code sample or test case demonstrating the expected behavior

Thank you for contributing to DVM!
