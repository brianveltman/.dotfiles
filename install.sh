#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
EXTRA_DIR="$HOME/.extra"

# Make utilities available
export PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Start installing all applications and binaries
echo "Setting up your personal settings..."

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Run tests
if is-executable bats; then bats test/*.bats; else echo "Skipped: tests (missing: bats)"; fi

# Make ZSH the default shell environment
# chsh -s $(which zsh)

# Install global Yarn packages
# yarn global add create-react-app yo

# Create a Code directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
# mkdir $HOME/Sites

# Set macOS preferences
# We will run this last because this will reload the shell
# source macOS/.macOS
# source macOS/.dock

# Install extra stuff
# if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then
#   . "$EXTRA_DIR/install.sh"
# fi
