# .bashrc

export MAKEINC=$HOME/makcomm

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias rm="rm -i"
alias ll="ls -al"
alias less='less -R'
alias grep='grep --colour=auto'
alias screenfetch='screenfetch -D "Red Hat Linux"'
alias ack='ack -ai'

if support "ls --color"; then
    # GNU
    alias ls='ls -FN --color=auto --time-style=long-iso'
else
    # OS X / BSD
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -FG'
fi
#

#export
export EDITOR=vim
export PATH=$HOME/tools:$HOME/usr/bin:$HOME/usr/local/bin:$HOME/tools/subversion-scripts:$PATH
export LD_LIBRARY_PATH=$HOME/Project/VS8102_CLSS/apps/app_cluster/curl/lib:$LD_LIBRARY_PATH
export MAKEINC=/home/project/makcomm
export HISTSIZE="15000"

# for tmux: export 256color
infocmp screen-256color > /dev/null 2>&1
[ $? -eq 0 -a -n "$TMUX" ] && export TERM=screen-256color || export TERM=xterm-256color
#
# man colorful
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m'     # end mode
export LESS_TERMCAP_se=$'\E[0m'     # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44m' # begin standout-mode – info
export LESS_TERMCAP_ue=$'\E[0m'     # end underline
export LESS_TERMCAP_us=$'\E[32m'    # begin underline
#


#PS1="\033[1;32m\]\$(date +%H:%M)\033[0m\] \[\033[1;31m\]\u@\[\033[0m\h\[\033[0m\]\[\033[1;35m\] \w\[\033[0m\]>" 
#PS1="${BRIGHT_CYAN}[${BRIGHT_GREEN}\t ${GREEN}\u${WHITE}@${CYAN}\h${WHITE}:\w${BRIGHT_CYAN}]${NORMAL}\$ ${RESET}"
PS1="\[\033[1;31m\]\u@\[\033[1;31m\]\h \[\033[1;33m\]\w\[\033[1;36m\]\$ \[\033[0m\]"
PS2="\[\033[1;32m\]continue-> \[\033[0m\]"
PS4="$0.$LINENO+ "
#

# reset ls color
LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:*.c=01;35:*.h=01;33:*.mk=01;32:*.xz=00;31"
export LS_COLORS
#

# ccache & distcc
alias enjoy-ccache-distcc="source $HOME/tools/use_distcc_ccache"
#

# record cd history "cd --"
cd_func ()
{
	local x2 the_new_dir adir index
	local -i cnt

	if [[ $1 ==  "--" ]]; then
        dirs -v
        return 0
    fi
	the_new_dir=$1
    [[ -z $1 ]] && the_new_dir=$HOME

	if [[ ${the_new_dir:0:1} == '-' ]]; then
		#
		#Extract dir N from dirs
		index=${the_new_dir:1}
	    [[ -z $index ]] && index=1
	    adir=$(dirs +$index)
	    [[ -z $adir ]] && return 1
	    the_new_dir=$adir
	fi

	#
	# '~' has to be substituted by ${HOME}
	[[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

	#
	# Now change to the new dir and add to the top of the stack
	pushd "${the_new_dir}" > /dev/null
	[[ $? -ne 0 ]] && return 1
	the_new_dir=$(pwd)

	#
	# Trim down everything beyond 11th entry
	popd -n +11 2>/dev/null 1>/dev/null

	#
	# Remove any other occurence of this dir, skipping the top of the stack
	for ((cnt=1; cnt <= 10; cnt++)); do
		x2=$(dirs +${cnt} 2>/dev/null)
		[[ $? -ne 0 ]] && return 0
		[[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
		if [[ "${x2}" == "${the_new_dir}" ]]; then
			popd -n +$cnt 2>/dev/null 1>/dev/null
			cnt=cnt-1
		fi
	done

	return 0
}
alias cd=cd_func
#

#before login
cmatrix -a -u 3
#screenfetch
