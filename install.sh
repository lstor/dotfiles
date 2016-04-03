echo "Installing dotfiles ..."

# Clone repo
git clone --bare https://github.com/lstor/dotfiles $HOME/.dotfiles

# Don't show untracked files
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Get files from bare repo
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
echo "Almost done, sourcing .bashrc ..."

source ~/.bashrc
echo "Installation done!"
