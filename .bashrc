#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

use_color=true

safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi
fi

RGB1="$(grep -A 1 '\[Color1\]' ~/.cache/wal/colors-konsole.colorscheme | awk -F= '/Color=/{print $2}' | sed 's/,/;/g')"
RGB2="$(grep -A 1 '\[Color2\]' ~/.cache/wal/colors-konsole.colorscheme | awk -F= '/Color=/{print $2}' | sed 's/,/;/g')"
RGB3="$(grep -A 1 '\[Color3\]' ~/.cache/wal/colors-konsole.colorscheme | awk -F= '/Color=/{print $2}' | sed 's/,/;/g')"

PS1="\[\033[38;2;${RGB1}m\]\w \[\033[0m\]\[\033[38;2;${RGB2}m\]\$\[\033[0m\] "

unset use_color safe_term match_lhs sh

shopt -s histappend

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

bind '"\C-e": edit-and-execute-command'
