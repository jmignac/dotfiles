export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

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
alias grom="gup && git reset --hard origin/master"
alias grim="git rebase -i master"
alias grm="git rebase master"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

if [ -e /Users/jmignac/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jmignac/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
