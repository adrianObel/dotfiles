# ~/.config/fish/config.fish
# Main fish shell configuration

# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

# Add local bin to PATH if it exists
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end

# Homebrew (macOS)
if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin
end

# Aliases
alias v='nvim'
alias vim='nvim'

# Better defaults if tools are available
if command -q eza
    alias ls='eza'
    alias ll='eza -la'
    alias tree='eza --tree'
end

if command -q bat
    alias cat='bat'
end

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

# Clean greeting
set fish_greeting

# Source local config if it exists (for machine-specific settings)
if test -f ~/.config/fish/config.local.fish
    source ~/.config/fish/config.local.fish
end
