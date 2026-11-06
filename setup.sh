#!/usr/bin/env bash


# ------------------------------------------------- #
#                     packages                      #
# ------------------------------------------------- #


pacman_packages=(
  luarocks
  npm
  python-pipx
  python-poetry
  waybar
  swww
  feh
  ttf-jetbrains-mono-nerd
  firefox
  chromium
  pulseaudio
  pavucontrol
  tree-sitter-cli # required by neovi
  neovim
  git
  tmux
  fzf
  telegram-deskto
  discor
  hypridle
  hyprshot
  hyprlock
  hyprpicker
  sxiv
  vlc
  nautilus
  base-devel
  make
  unzip
  gcc
  ripgrep
  ghostty
  zsh
  obsidian
  pacman-contrib
  btop
  figlet
  man
  syncthing
  docker
  docker-compose
  deno
  djview
  nmap
  traceroute
  noto-fonts-emoji
)

yay_packages=(
  happ
  python-pywal
  python-pywalfox
  walogram
  webkitgtk
  vesktop
)

sudo pacman -S --needed --noconfirm ${pacman_packages[@]}

if ! command -v yay >/dev/null 2>&1; then
  # ./install_yay.sh
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
fi

yay -S ${yay_packages[@]} --needed --noconfirm


# ------------------------------------------------- #
#                     .config                       #
# ------------------------------------------------- #


mv .config/* ~/.config


# ------------------------------------------------- #
#                   wallpapers                      #
# ------------------------------------------------- #


mkdir ~/Pictures
cp Wallpapers ~/Pictures


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
#                    xdg-mime                       #
# ------------------------------------------------- #


xdg-mime default firefox.desktop application/pdf
xdg-mime default djview.desktop application/djvu

xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime default org.gnome.Nautilus.desktop x-directory/normal

xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/jpg
xdg-mime default sxiv.desktop image/png


# ------------------------------------------------- #
#                       zsh                         #
# ------------------------------------------------- #


mv .zshrc ~

if ! ( [ -d "${ZSH:-}" ] || [ -d "${HOME}/.oh-my-zsh" ] || grep -Eq "oh-my-zsh|\\${ZSH:-}" "${HOME}/.zshrc" 2>/dev/null ); then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


