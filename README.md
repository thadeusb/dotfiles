# Dotfiles Base

This project serves as a base standard linux developer installation without complicated dotfiles configuration.

## Install

* Clone the repository to `~/.dotfiles/`.
* Run the dotfiles command `cd ~/.dotfiles && ./dotfiles`
* Change shells to ZSH `chsh -s $(which zsh)`

## Update

* Run the command `dotfiles` from anywhere.

## Managing dotfiles

The best way to manage dotfiles is to maintain a copy of the dotfiles with
your own customizations. These changes SHOULD NEVER be committed to a public
repo and are mainly to ease in the setup of a new system just for you.

## Structure

* `dotfiles/link` - Files here will be symlinked to the corresponding location into `$HOME`.
* `dotfiles/copy` - Files here will be copied to the corresponding location into `$HOME`.
* `dotfiles/system` - Files here will be copied to the corresponding location into `/`.
* `dotfiles/init` - Files here will be sourced/executed only when `dotfiles` is executed.
* `dotfiles/source` - Files here will always be sourced/executed for every terminal.

## Common Customize Patterns

* Link Sublime Text license file
	`link/.config/sublime-text-3/Local/License.sublime_license`
* Link SSH config
	`link/.ssh/config`
* Change packages installed by APT and NPM
	`init/10_ubuntu.sh`
* Create init script to create clone git repos `init/12_repos.sh`
	```
	mkdir -p ~/Workspace

	if ! cd ~/Workspace/project; then
		cd ~/Workspace && git clone git@project.git
	fi
	```
