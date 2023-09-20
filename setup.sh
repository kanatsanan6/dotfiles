#/bin/bash

links=(
  zshrc tmux.conf
)

read -n1 -p "Install dotfiles to $HOME (overwriting)? (y/n)" answer
echo ""
if [[ $answer == "y" ]]; then
  for link in ${links[@]}; do
    echo "Linking $link"
    ln -sfn $PWD/$link $HOME/.$link
  done
fi

read -n1 -p "Install nvim to ~/.config/nvim (overwriting)? (y/n)" vim_answer
echo ""
if [[ $vim_answer == "y" ]]; then
  echo "Linking init.vim"
  ln -sfn $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

  echo "Linking nvim config"
  for config in $(ls $PWD/nvim/vim); do
    echo "Linking $config"
    ln -sfn $PWD/nvim/vim/$config $HOME/.config/nvim/vim/$config
  done
fi


read -n1 -p "Install script to ~/.config/nvim (overwriting)? (y/n)" script_answer
echo ""
if [[ $script_answer == "y" ]]; then
  echo "Linking script"
  for script in $(ls $PWD/scripts); do
    echo "Linking $script"
    ln -sfn $PWD/scripts/$script $HOME/$script
  done
fi
