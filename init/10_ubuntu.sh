is_ubuntu || return 1

packages=(
    build-essential
    curl
    git
    google-chrome-stable
    nodejs
    npm
    python-dev
    samba
    sublime-text
    virtualenv
    zsh
)

npm_globals=(
    create-react-app
)

wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

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

echo "Installing NPM packages: ${npm_globals[*]}"
# NPM
for package in "${npm_globals[@]}"; do
    sudo npm --silent install -g "$package"
done

echo "Installing ZSH (Shells will need to be manually changed later)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

