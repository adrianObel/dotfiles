#!/usr/bin/env bash
#
# Simple dotfiles installation script for macOS
# Uses GNU Stow for symlink management

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Package definitions
BREW_FORMULAS=(neovim fish git gh ripgrep fd fzf bat eza git-delta)
BREW_CASKS=(ghostty)
STOW_PACKAGES=(nvim fish ghostty git)

# Parse command line arguments
INSTALL_PACKAGES=true
STOW_CONFIGS=true

while [[ $# -gt 0 ]]; do
    case $1 in
        --packages-only)
            STOW_CONFIGS=false
            shift
            ;;
        --stow-only)
            INSTALL_PACKAGES=false
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--packages-only|--stow-only]"
            exit 1
            ;;
    esac
done

info() {
    echo -e "${BLUE}==>${NC} $1"
}

success() {
    echo -e "${GREEN}✓${NC} $1"
}

warning() {
    echo -e "${YELLOW}!${NC} $1"
}

error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew
install_homebrew() {
    if ! command_exists brew; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for this session
        if [[ -f /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        success "Homebrew installed"
    else
        success "Homebrew already installed"
    fi
}

# Install packages
install_packages() {
    info "Installing required packages..."

    if ! command_exists brew; then
        error "Homebrew not found. Please install it first."
        exit 1
    fi

    # Install GNU Stow
    if ! command_exists stow; then
        brew install stow
        success "GNU Stow installed"
    else
        success "GNU Stow already installed"
    fi

    # Install Homebrew formulas
    for package in "${BREW_FORMULAS[@]}"; do
        if brew list "$package" &>/dev/null; then
            success "$package already installed"
        else
            info "Installing $package..."
            brew install "$package"
            success "$package installed"
        fi
    done

    # Install Homebrew casks
    for cask in "${BREW_CASKS[@]}"; do
        if brew list --cask "$cask" &>/dev/null; then
            success "$cask already installed"
        else
            info "Installing $cask..."
            brew install --cask "$cask"
            success "$cask installed"
        fi
    done
}

# Stow packages
stow_packages() {
    info "Stowing dotfiles..."

    cd "$DOTFILES_DIR"

    for package in "${STOW_PACKAGES[@]}"; do
        if [[ ! -d "$package" ]]; then
            warning "Package directory $package not found, skipping..."
            continue
        fi

        info "Stowing $package..."
        stow -R "$package"
        success "$package stowed"
    done
}

# Set fish as default shell
set_fish_shell() {
    if command_exists fish; then
        local fish_path
        fish_path=$(command -v fish)

        if [[ "$SHELL" != "$fish_path" ]]; then
            info "Setting fish as default shell..."

            # Add fish to /etc/shells if not already there
            if ! grep -q "$fish_path" /etc/shells; then
                echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
            fi

            # Change shell
            chsh -s "$fish_path"
            success "Fish set as default shell (restart terminal to apply)"
        else
            success "Fish already set as default shell"
        fi
    fi
}

# Main installation
main() {
    echo ""
    info "Dotfiles Installation"
    echo ""

    if [[ "$INSTALL_PACKAGES" == true ]]; then
        install_homebrew
        install_packages
        echo ""
    fi

    if [[ "$STOW_CONFIGS" == true ]]; then
        stow_packages
        echo ""
        set_fish_shell
        echo ""
    fi

    success "Installation complete!"
    echo ""
    info "Next steps:"
    echo "  1. Restart your terminal or run: exec fish"
    echo "  2. Open nvim and let plugins install"
    echo "  3. Create ~/.gitconfig.local for machine-specific git settings"
    echo "  4. Create ~/.config/fish/config.local.fish for machine-specific fish config"
    echo ""
}

main
