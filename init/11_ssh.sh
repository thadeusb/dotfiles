is_ubuntu || return 1

if [ ! -f $HOME/.ssh/id_rsa ]; then
	ssh-keygen -t rsa -N "" -f $HOME/.ssh/id_rsa
fi
