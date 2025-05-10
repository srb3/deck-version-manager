#!/usr/bin/env bash
#
# DVM - Deck Version Manager
# Installation Script
#

set -e

DVM_DIR="${HOME}/.dvm"
DVM_REPO="https://raw.githubusercontent.com/srb3/deck-version-manager/main"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print banner
echo -e "${BLUE}"
echo '  ____   __     __  __  __'
echo ' |  _ \  \ \   / / |  \/  |'
echo ' | | | |  \ \ / /  | |\/| |'
echo ' | |_| |   \ V /   | |  | |'
echo ' |____/     \_/    |_|  |_|'
echo -e "${NC}"
echo "Deck Version Manager - Installation"
echo "=================================="

# Check requirements
check_requirements() {
  local missing_tools=()
  
  for tool in curl tar grep gunzip file; do
    if ! command -v $tool >/dev/null 2>&1; then
      missing_tools+=("$tool")
    fi
  done
  
  if [ ${#missing_tools[@]} -gt 0 ]; then
    echo -e "${RED}Error: Missing required tools:${NC}"
    for tool in "${missing_tools[@]}"; do
      echo "  - $tool"
    done
    echo "Please install these tools before continuing."
    exit 1
  fi
}

# Create directories
create_directories() {
  echo "Creating directories..."
  mkdir -p "${DVM_DIR}/bin"
  mkdir -p "${DVM_DIR}/versions"
  echo -e "${GREEN}✓ Created DVM directories${NC}"
}

# Download the script
download_script() {
  echo "Downloading DVM..."
  curl -s -o "${DVM_DIR}/bin/dvm" "${DVM_REPO}/dvm"
  chmod +x "${DVM_DIR}/bin/dvm"
  echo -e "${GREEN}✓ Downloaded DVM script${NC}"
}

# Download completions
download_completions() {
  echo "Downloading shell completions..."
  mkdir -p "${DVM_DIR}/completions"
  curl -s -o "${DVM_DIR}/completions/dvm.bash" "${DVM_REPO}/completions/dvm.bash"
  curl -s -o "${DVM_DIR}/completions/dvm.zsh" "${DVM_REPO}/completions/dvm.zsh"
  echo -e "${GREEN}✓ Downloaded shell completions${NC}"
}

# Print final instructions
print_instructions() {
  echo ""
  echo -e "${GREEN}DVM has been successfully installed!${NC}"
  echo ""
  echo -e "${YELLOW}To complete the installation, add the following to your shell configuration file (.bashrc, .zshrc, etc.):${NC}"
  echo ""
  echo '  export PATH="$HOME/.dvm/bin:$PATH"'
  echo ""
  echo -e "${YELLOW}To enable shell completions, add one of the following:${NC}"
  echo ""
  echo '  # For Bash'
  echo '  source "$HOME/.dvm/completions/dvm.bash"'
  echo ""
  echo '  # For Zsh'
  echo '  source "$HOME/.dvm/completions/dvm.zsh"'
  echo ""
  echo -e "${BLUE}Run 'dvm help' to get started.${NC}"
}

# Main installation process
main() {
  echo "Starting installation..."
  check_requirements
  create_directories
  download_script
  download_completions
  print_instructions
}

# Run the installer
main
