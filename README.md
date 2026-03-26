# dotfiles

My personal dotfiles, managed with GNU Stow.

## Quick Start

Clone this repository and run the installation script:

```bash
git clone https://github.com/adrianObel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```


## What's Included

- **nvim** - Neovim configuration
- **fish** - Fish shell
- **ghostty** - Terminal emulator configuration
- **git** - Git configuration

## Installed Utilities

The installation script automatically installs the following tools via Homebrew:

- **neovim** - Modern Vim-based text editor
- **fish** - Friendly interactive shell
- **ghostty** - Fast, native terminal emulator
- **git** - Distributed version control system
- **gh** - GitHub CLI
- **worktrunk** - Git workflow tool for managing branches
- **ripgrep** - Fast recursive search tool
- **fd** - Fast alternative to `find`
- **fzf** - Command-line fuzzy finder
- **bat** - Cat clone with syntax highlighting
- **eza** - Modern replacement for `ls`
- **git-delta** - Syntax-highlighting pager for git diffs

## Manual Installation

### Install Individual Packages

You can stow individual packages instead of running the full install:

```bash
cd ~/.dotfiles
stow nvim       # Only install Neovim config
stow fish       # Only install Fish config
stow ghostty    # Only install Ghostty config
stow git        # Only install Git config
```

### Preview Changes (Dry Run)

See what would be symlinked without making changes:

```bash
cd ~/.dotfiles
stow -nv nvim   # Preview nvim stowing
```

### Unstow a Package

Remove symlinks for a specific package:

```bash
cd ~/.dotfiles
stow -D nvim    # Remove Neovim symlinks
```

### Restow a Package

Update symlinks after making changes:

```bash
cd ~/.dotfiles
stow -R nvim    # Restow Neovim config
```

## Installation Options

Run the install script with flags for partial installation:

```bash
./install.sh --packages-only    # Only install packages, skip stowing
./install.sh --stow-only        # Only stow configs, skip package installation
```

## Adding New Dotfiles

To add a new configuration:

1. Create a directory that mirrors your home structure:
   ```bash
   mkdir -p newapp/.config/newapp
   ```

2. Add your config files:
   ```bash
   cp ~/.config/newapp/config newapp/.config/newapp/
   ```

3. Stow it:
   ```bash
   cd ~/.dotfiles
   stow newapp
   ```

## Machine-Specific Configuration

For settings that differ between machines, use local config files:

### Git
Create `~/.gitconfig.local` for machine-specific settings:
```gitconfig
[user]
    email = work@company.com

[core]
    sshCommand = ssh -i ~/.ssh/work_key
```

This file is automatically included via the main `.gitconfig`.

### Fish Shell
Create `~/.config/fish/config.local.fish` for machine-specific settings:
```fish
# Work-specific aliases
alias deploy='ssh deploy@server'

# Machine-specific environment variables
set -gx WORK_PROJECT_DIR ~/workspace
```

This file is automatically sourced if it exists.

## Directory Structure

```
~/.dotfiles/
├── install.sh              # Installation script
├── .stowrc                 # Stow configuration
├── README.md               # This file
│
├── nvim/
│   └── .config/nvim/       # Neovim config (stows to ~/.config/nvim)
│
├── fish/
│   └── .config/fish/       # Fish shell config (stows to ~/.config/fish)
│       ├── config.fish     # Main fish config
│       └── functions/      # Custom fish functions
│
├── ghostty/
│   └── .config/ghostty/    # Ghostty config (stows to ~/.config/ghostty)
│
└── git/
    └── .gitconfig          # Git config (stows to ~/.gitconfig)
```

## Updating

To update your dotfiles on a machine:

```bash
cd ~/.dotfiles
git pull
stow -R nvim fish ghostty git   # Restow all packages
```

## License

[MIT](LICENSE)
