#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'
alias sudo='sudo '

function color_my_prompt {
    local __time="\[\033[01;36m\](\t)"
    local __user_name="\[\e[m\]\[\e[1;32m\]${USER}"
    local __host_name="@${HOSTNAME}"
    local __new_line="\[\e[m\]\n[\w]"
    local __git_branch_color="\[\033[36m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__time $__user_name$__host_name $__new_line$__git_branch_color $__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

export MANPAGER="less -isg"

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# append history entries..
shopt -s histappend


# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

export WORKON_HOME=~/.envs
source /usr/bin/virtualenvwrapper.sh
export EDITOR=vim
export VISUAL=vim
export PATH="$PATH:/home/mike/.gem/ruby/2.6.0/bin"
alias config='/usr/bin/git --git-dir=/home/mike/.dotfiles/ --work-tree=/home/mike'
complete -F _complete_alias config
export BASH_COMPLETION_USER_FILE=/usr/share/bash-complete-alias/complete_alias
