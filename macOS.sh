echo "We are using macOS"
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if ! grep -q 'eval "$(/usr/local/bin/brew shellenv)"' "$HOME/.zprofile"; then
    (echo 'eval "$(/usr/local/bin/brew shellenv)"') >> "$HOME/.zprofile"
fi
eval "$(/usr/local/bin/brew shellenv)"

# Start installing all applications and binaries
echo "Setting up your personal settings..."

# Update Homebrew recipes and disable analytics from being send
brew analytics off
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

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