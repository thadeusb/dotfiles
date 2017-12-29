is_ubuntu || return 1

packages=(
    build-essential
    samba
    zsh
    git
    python-dev
    virtualenv
    nodejs
    npm
    sublime-text
)

npm_globals=(
    create-react-app
    bower
    coffee-script
    less
)

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "APT Update"
sudo apt-get -qq update
echo "APT Upgrade"
sudo apt-get -qq upgrade

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  echo "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi

install_dpkg "chrome" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

echo "Installing NPM packages: ${npm_globals[*]}"
# NPM
for package in "${npm_globals[@]}"; do
    sudo npm --silent install -g "$package"
done

echo "Installing ZSH"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
