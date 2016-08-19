#! /bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

create_symlink() {
  # $1 = from, $2 = to
  if ! [ -e "$2$1" ]
  then
    echo "$1 $2"
    ln -s "$DIR/$1" $2
    echo "Created symlink $2$1 -> $DIR/$1"
  else
    echo "Symlink found $2$1 -> $DIR/$1"
  fi
}

setup_shell() {
  create_symlink bash/.bashrc ~/
}

setup_brew() {
  if ! [ -x brew ]
  then
    echo "Found existing brew"
    return 1
  fi

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
}

setup_emacs() {
  brew cask install emacs
  create_symlink .emacs.d/ ~/
}

setup_neovim() {
  brew install neovim/neovim/neovim
  create_symlink neovim/ ~/.config/
}

if [ ! -d ~/.config ]
then
  mkdir ~/.config
fi

setup_shell
setup_brew
setup_emacs
setup_neovim
brew cask install slack
