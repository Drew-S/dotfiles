alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias vi='vim'

alias c='xclip -selection clipboard'
alias v='xclip -o -selection clipboard'

alias cat='bat'

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias cdr='cd "$(cat ~/.rangerdir)"'
