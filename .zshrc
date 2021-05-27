export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)


source $ZSH/oh-my-zsh.sh

# User configuration

alias v="vim"
alias grom="gup && git reset --hard origin/master"
alias grim="git rebase -i master"
alias grm="git rebase master"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

if [ -e /Users/jmignac/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jmignac/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
