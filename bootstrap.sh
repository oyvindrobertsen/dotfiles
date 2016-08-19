#! /bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

create_symlink() {
  # $1 = from, $2 = to
  if [ ! -d "$2$1" ]
  then
    ln -sr "$DIR/$1" $2
    echo "Created symlink $2$1 -> $DIR/$1"
  fi
}

install() {
  # Check if already installed
  if [ ! -x $1 ]
  then
    echo "Found existing $1"
    return 1
  fi
  sudo pacman -S $1
}

setup_emacs() {
  install emacs
  create_symlink .emacs.d/ ~/
}

setup_neovim() {
  install neovim
  create_symlink neovim/ ~/.config/
}

setup_i3() {
  create_symlink i3/ ~/.config/
}

setup_emacs
setup_neovim
setup_i3
