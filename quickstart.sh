# /bin/bash

if [ ! -f ./quickstart.sh ];
then
    echo "ERROR: CD TO MY DIRECTORY BEFORE YOU RUN ME!"
    return 1
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


link() {
    if [ -z "$1" ] || [ -z "$2" ];
    then
        echo "EMPTY LINK PATHS"
        return 1
    fi
    ABS_TARGET=$(readlink -f $1)
    ABS_LINK=$2
    echo "New link $ABS_LINK"
    echo "Points to $ABS_TARGET"
    ln -sfb $ABS_TARGET $ABS_LINK

    return 0
}

link "./.bashrc" "$HOME/.bashrc"
echo
link "./.inputrc" "$HOME/.inputrc"
echo
link "./.vimrc" "$HOME/.vimrc"
echo
link "./.tmux.conf" "$HOME/.tmux.conf"
echo
link "./.vim/mthesaur.txt" "$HOME/.vim/mthesaur.txt"
echo
