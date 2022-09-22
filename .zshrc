# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/c/Users/erikg/.zshrc'

alias ls='ls -AF --color=auto'
autoload -Uz compinit
compinit
# End of lines added by compinstall

function parse_git_branch() {
    #git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

COLOR_DEF=%{$'\e[0m'%}
COLOR_USR=%{$'\e[38;5;243m'%}
COLOR_DIR=%{$'\e[38;2;122;82;164m'%}
COLOR_GIT=%{$'\e[0;33m'%}
setopt PROMPT_SUBST

PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}${vcs_info_msg_0_}${COLOR_DEF} $ '
#export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '
#zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' formats "[%b]" # hash & branch
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
