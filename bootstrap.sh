#!/usr/bin/env bash
#
# bootstrap installs things.

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd)

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_scripts () {
  info 'installing scripts'

  local overwrite_all=false backup_all=false skip_all=false
  for src in $(find "$DOTFILES_ROOT/scripts" -maxdepth 1 -name '*.sh')
  do
    dst="$HOME/.bin/$(basename "${src}")"
    link_file "$src" "$dst"
  done
}

install_fzf () {
  info 'installing fzf'

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
}

configure_vim () {
  info 'configuring vim'

  # Link vim config to neovim config
  mkdir -p $HOME/.config
  ln -s $PWD/vim/init.lua $HOME/.config/nvim/init.lua
  ln -s $PWD/vim/lua $HOME/.config/nvim/lua
  ln -s $PWD/vim/fnl $HOME/.config/nvim/fnl
  # ln -s $HOME/.vim $HOME/.config/nvim
  # ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
}

configure_zsh () {
  info 'configuring zsh'

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | grep -v "env zsh")"

  # Install pure colorscheme
  git clone --depth 1 https://github.com/sindresorhus/pure.git $HOME/.pure
  mkdir -p $HOME/.oh-my-zsh/functions
  mkdir -p $HOME/.oh-my-zsh/custom/themes
  ln -s $HOME/.pure/pure.zsh  $HOME/.oh-my-zsh/functions/prompt_pure_setup
  ln -s $HOME/.pure/pure.zsh  $HOME/.oh-my-zsh/custom/themes/pure.zsh-theme
  ln -s $HOME/.pure/async.zsh $HOME/.oh-my-zsh/functions/async
}

remove_old_files () {
  rm -rf ~/.fzf
  rm -rf ~/.pure
  rm -rf ~/.oh-my-zsh
  rm -f ~/.config/nvim/init.vim
  rm -f ~/.config/nvim/.vim
  rm -f ~/.tmux.conf
  rm -f ~/.bashrc
  rm -f ~/.vimrc
  rm -f ~/.ideavimrc
}

#remove_old_files
#install_fzf
configure_vim
configure_zsh
install_dotfiles
install_scripts

echo ''
echo '  All installed!'

# vim:shiftwidth=2:foldlevel=0
