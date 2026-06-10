#!/usr/bin/env bash


# ------------------------------------------------- #
#                     packages                      #
# ------------------------------------------------- #


pacman_packages=(
  # package managers
  luarocks 
  npm 
  python-pipx 
  python-poetry 

  # appearance
  waybar 
  python-pywal 
  swww 
  feh 

  # fonts
  ttf-jetbrains-mono-nerd 

  # web-browsers
  firefox 
  chromium 

  # audio
  pulseaudio 
  pavucontrol 

  # dev env
  tree-sitter-cli # required by neovim
  neovim 
  git
  tmux 
  fzf 

  # messengers
  telegram-desktop
  discord

  base-devel 
  make 
  unzip 
  gcc 
  ripgrep 
  hyprlauncher 
  ghostty 
  zsh 
  hyprshot 
  hyprlock 
  obsidian 
  sxiv 
  pacman-contrib 
  btop 
  figlet 
  man 
)
# TODO: delete hyprlauncher

yay_packages=(
  happ
  walogram
)

if ! command -v yay >/dev/null 2>&1; then
  # ./install_yay.sh
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
fi

sudo pacman -S --needed --noconfirm ${pacman_packages[@]}

yay -S ${yay_packages[@]} --needed --noconfirm

pipx install pywalfox


# ------------------------------------------------- #
#                     .config                       #
# ------------------------------------------------- #


mv .config/* ~/.config
# ln -s .config/* ~/.config


# ------------------------------------------------- #
#                   wallpapers                      #
# ------------------------------------------------- #


mkdir ~/Pictures
mv Wallpapers ~/Pictures


# ------------------------------------------------- #
#                       poetry                      #
# ------------------------------------------------- #


poetry config virtualenvs.in-project true


# ------------------------------------------------- #
#                       git                         #
# ------------------------------------------------- #


echo -n "enter git user.email: "
read git_user_email
git config --global user.email $git_user_email

echo -n "enter git user.name: "
read git_user_name
git config --global user.name $git_user_name

git config --global init.defaultBranch main


# ------------------------------------------------- #
#                       figlet                      #
# ------------------------------------------------- #


sudo mv sblood.flf /usr/share/figlet/fonts


# ------------------------------------------------- #
#                       lua                         #
# ------------------------------------------------- #


sudo luarocks install lua-cjson


# ------------------------------------------------- #
#                       tmux                        #
# ------------------------------------------------- #


mv .tmux.conf ~


# ------------------------------------------------- #
#                 tmux-sessionizer                  #
# ------------------------------------------------- #


mkdir -p ~/.local/bin
mv tmux-sessionizer ~/.local/bin


# ------------------------------------------------- #
#                       zsh                         #
# ------------------------------------------------- #


mv .zshrc ~

if ! ( [ -d "${ZSH:-}" ] || [ -d "${HOME}/.oh-my-zsh" ] || grep -Eq "oh-my-zsh|\\${ZSH:-}" "${HOME}/.zshrc" 2>/dev/null ); then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


