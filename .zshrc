export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
export EDITOR="nvim"
export VISUAL="nvim"

# ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Prompt customization
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# Tell spin prompt apart from local prompt
if [[ $SPIN ]]; then
  PROMPT+="%{$FG[113][spin]%}"
fi
# Add git information to prompt
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
# Add number of bg to prompt
_jobscount() {
  local stopped=$(jobs -sp | wc -l | xargs)
  local running=$(jobs -rp | wc -l | xargs)
  ((stopped)) && echo -n "[%{${FG[113]}%}${stopped}%{$reset_color%}] "
}
PROMPT+='$(_jobscount)'
PROMPT+='\$ '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# User configuration

alias v="vim"
alias grom="git reset --hard origin/master"
alias grim="git rebase -i master"
alias grm="git rebase master"
alias rdb="bin/rails db:migrate db:test:prepare"
alias jmeter="/usr/local/bin/jmeter"
alias vimrc="v ~/.vimrc"
alias v="nvim"
alias vi="vim"
alias vim="nvim"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

if [ -e /Users/jmignac/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jmignac/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Load os specific config
[ "$OS" = "Linux" ] && source ~/dotfiles/os-linux.sh
[ "$OS" = "Darwin" ] && source ~/.dotfiles/os-darwin.sh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
