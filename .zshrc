#!/bin/zsh
#  ===========
#  == zshrc ==
#  ===========
#
#  Load all the scripts in {path to this .zshrc}/.yabs
#
# Clearfix
precmd_functions=()
preexec_functions=()

if [[ "$OSTYPE" == linux* ]]
then
    export PATH="/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.5.4"
fi

# Default yabs utils
FILES=( "yabsrc" "utils" "venvs" "git" "prompt" "history" "aliases" "kubectl")

# Load the files from .yabs in the same path than this script
for file in $FILES; do
  source $HOME/.yabs/$file
done

# Load extensions
for extension in ${yabs_extensions}; do
  if [[ -f "$HOME/.yabs/extensions/$repo" ]]; then
    source $HOME/.yabs/extensions/$repo 2> /dev/null
  fi
done

# Load autocompletion
typeset -U fpath
fpath+=("$HOME/.yabs/zsh-autocompletion")
autoload -U compinit
compinit

# Clean env
unset FILES
