#! /bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLATFORM="$(uname)"

create_symlink() {
  # $1 = from, $2 = to
  if [ ! -d "$2$1" ]
  then
    ln -sr "$DIR/$1" $2
    echo "Created symlink $2$1 -> $DIR/$1"
  fi
}

install_arch() {
  sudo pacman -S $1
}

install_osx() {
  brew install $1
}

install() {
  # Check if already installed
  if [ ! -x $1 ]
  then
    echo "Found existing $1"
    return 1
  fi

  if [ $PLATFORM = "Linux" ]
  then
    install_arch $1
  elif [ $PLATFORM = "Darwin" ]
  then
    install_osx $1
  else
    return 0
  fi
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
if [ $PLATFORM = "Linux" ];then setup_i3; fi

