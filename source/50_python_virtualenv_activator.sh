activator="activate.sh"

# Searches entire pwd for activate.sh
function activate_global_cd {
    # Change IFS temporarily for iterating through directories
    OLD_IFS="$IFS"
    IFS="/"

    ROOT=""

    _dfiles="`pwd`"

    for token in $_dfiles
    do
        ROOT="$ROOT$token/"
        activator="${ROOT}venv/bin/activate"

        if [ -f "$activator" ]
        then
            echo "sourcing $activator"
            source "$activator"
        fi
    done

    # Restore IFS to its original state
    IFS="$OLD_IFS"
}

# Searches only the arguments directories for activate.sh
function activate_cd {
    # Change IFS temporarily for iterating through directories
    OLD_IFS="$IFS"
    IFS="/"

    ROOT="`pwd`/"

    # Actually change directory
    cd "$1"

    _dfiles="$1"

    for token in $_dfiles
    do
        ROOT="$ROOT$token/"
        activator="${ROOT}venv/bin/activate"

        if [ -f "$activator" ]
        then
            echo "sourcing $activator"
            source "$activator"
        fi
    done

    # Restore IFS to its original state
    IFS="$OLD_IFS"
}

alias cd='activate_cd'

# Always do a global search when starting a new terminal instance.
activate_global_cd

