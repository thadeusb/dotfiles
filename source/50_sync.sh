function update_dotfiles() {
    cd ~/.dotfiles && git pull && ./dotfiles
}

alias dotfiles='update_dotfiles'
