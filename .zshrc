export EDITOR=nvim
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ ! -f "$HOME/.antigen/antigen.zsh" ]; then
    mkdir -p $HOME/.antigen && curl -L git.io/antigen > antigen.zsh
fi

source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply
