# if running bash
if [ -n "BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="HOME/.local/bin:$PATH"
fi

# This allows you to switch between the Ubuntu root and your Windows Root.


# wr evaluates to the absolute path to your Windows user's root.
if [ "$HOSTNAME" = "NB19009" ];  then
    export wr=~/../../mnt/c/Users/Deniz.Dohmen/
elif [ "$HOSTNAME" = "Deniz" ]; then
    export wr=~/../../mnt/c/Users/Deniz/
fi

# This gives us a quick way of moving directly to the Windows root

alias cdwr='cd "$wr"'

# This brings you to your Windows Working directory immediatly when you open a new terminal.

cdwr

