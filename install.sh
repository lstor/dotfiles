echo "Installing dotfiles..."

# Clone repo
git clone --bare https://github.com/lstor/dotfiles $HOME/.dotfiles

# Configure
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
cfg config --local status.showUntrackedFiles no

# Get files from bare repo
cfg checkout

echo "Installation done!"
