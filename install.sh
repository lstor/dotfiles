RED="\e[31m";
YELLOW="\e[33m";
GREEN="\e[32m";
CLEAR="\e[0m";

TRUE=0
FALSE=1

arg_force=$1

function main() {

    ptitle "Installing dotfiles"
    echo

    check_if_already_installed
    platform_independent_install

    pinfo "Installing powerline ..."
    sudo pip install powerline-status powerline-gitstatus

    pinfo "Downloading dotfiles ..."
    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/lstor/dotfiles $HOME/.dotfiles-install

    pinfo "Hiding untracked files ..." -n
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
    ok

    pinfo "Moving downloaded files ..."
    move_files

    pinfo "Deleting installation directory ..." -n
    rm -rf $HOME/.dotfiles-install
    ok

    pinfo "Adding powerline location to .bashrc.local ..." -n
    powerline_location=$(pip show powerline-status | grep Location | awk '{ print $2 }')
    echo "# Set powerline location"                              >> $HOME/.bashrc.local
    echo "export POWERLINE_ROOT=${powerline_location}/powerline" >> $HOME/.bashrc.local
    ok

    pinfo "Sourcing .bashrc in case it affects vim operations ..." -n
    source ~/.bashrc
    ok

    # TODO: symlink _vimrc on windows

    pinfo "Updating Vim plugins ..." -n
    if ping -qc 1 github.com > /dev/null; then
        vim +PluginUpdate +qall
        ok
    else
        echo
        pwarn "Never mind, can't reach GitHub. Run ${YELLOW}:PluginUpdate${CLEAR} manually inside Vim."
    fi

    echo
    pwarn "Don't forget to ${YELLOW}source ~/.bashrc${CLEAR} after installation."

    ptitle "Installation done!"
}

function check_if_already_installed() {
    if [ -d $HOME/.dotfiles ]; then
        if forcing; then
            pwarn "$HOME/.dotfiles already exists: ${YELLOW}forcing overwrite${CLEAR}"
            rm -rf $HOME/.dotfiles
        else
            perr "$HOME/.dotfiles already exists: ${RED}aborting${CLEAR}. Use -f to force overwrite."
            exit 1
        fi
    fi
}

function platform_independent_install() {
    if has "pacman"; then
        pinfo "Pacman found, using that as installer"
        sudo pacman -Syq --needed git python python-pip tmux
    else
        pwarn "No suitable installer found!"
    fi
}

function move_files() {
    for file in `git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files`; do
        if [ -e $HOME/"$file" ]; then
            pwarn "$file already exists. " -n
            if confirm; then
                install_file "$file" "$file"
            else
                install_file "$file" "$file"-new
            fi
        else
            install_file "$file" "$file"
        fi
    done
}

function install_file() {
    # TODO: Consider using -b --suffix=new
    mkdir -p `dirname $HOME/"$2"`
    mv -v $HOME/.dotfiles-install/"$1" $HOME/"$2"
}

function confirm() {
    read -p "Overwrite (y/N)? " choice
    case "$choice" in
          y|Y|yes ) return $TRUE;;
          *       ) return $FALSE;;
    esac
}

function has() {
    if hash $1 2>/dev/null; then
        return $TRUE
    else
        return $FALSE
    fi
}

function forcing() {
    if [[ "$arg_force" == "-f" || "$arg_force" == "--force" ]]; then
        return $TRUE
    else
        return $FALSE
    fi
}

function ptitle() {
    echo -e "\n${GREEN}   == $1 ==${CLEAR}\n"
}

function pinfo() {
    echo -e $2 "\n${GREEN}==>${CLEAR} $1"
}

function pwarn() {
    echo -e $2 "${YELLOW}*** Warning:${CLEAR} $1"
}

function perr() {
    echo -e $2 "${RED}!!! Error:${CLEAR} $1"
}

function ok() {
    echo -e " ${GREEN}OK${CLEAR}"
}

main

