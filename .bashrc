#
# ~/.bashrc
#


[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

alias dt="echo -e '[$(date +%D)] [$(date +%H:%M:%S)]'"

export PS1="[\u@\h \W]$ "
# export PS1="[$(date +%H:%M:%S)] [\u@\h \W]$ "
# export PS1="[$(date +%D)] [$(date +%H:%M:%S)] [\u@\h \W]$ "

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
#alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
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

# aliases
alias date="date +%Y%m%d%H%M%S"
alias c="clear"
alias ..="cd ./.."
alias path='echo $PATH | tr ":" "\n" | nl'
alias xprop="xprop | rg WM_CLASS"
alias lsblk="lsblk -f"
alias t2="clear;tree -L 2"
alias usb="ranger /run/media/red/"
alias cal="cal --monday"
alias venv="source bin/activate"

# programs
alias pluto='julia -e "import Pluto;Pluto.run()"'
alias hx="helix"
alias o="xdg-open"
alias feh="feh -d"
alias dl="yt-dlp -x --audio-format mp3 -o '/home/red/music/%(title)s.%(exts)s'"
# alias steam2="GDK_SCALE=2 steam"

# quick edits
alias profile="$EDITOR $HOME/.bash_profile"
alias bashrc="$EDITOR $HOME/.bashrc"
alias term="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias xinitrc="$EDITOR $HOME/.xinitrc"
# alias rc="ranger $HOME/.config"
alias sxrc="$EDITOR $HOME/.config/sxhkd/sxhkdrc"
alias bsprc="$EDITOR $HOME/.config/bspwm/bspwmrc"

# pacman and yay
# alias pkglist="yay -Qttq > $HOME/.pkglist ; bat -p $HOME/.pkglist"
alias sy="sudo pacman -Sy"
alias syu="sudo pacman -Syu && packages"
alias qg="pacman -Q | grep $1"
alias qu="pacman -Qu"
alias qi="pacman -Qeq | sk --preview='pacman -Qi {}' --bind 'enter:execute(sudo pacman --noconfirm -Rs {})'"
alias qe="pacman -Qe | bat -p"
alias S="sudo pacman -S"
alias ss="pacman -Ss"
alias si="pacman -Ss | rg / | awk -F '/' '{print \$2}' | awk '{print \$1}' | sk --preview='pacman -Si {}' --bind 'enter:execute(sudo pacman --noconfirm -S {})'"
alias rs="sudo pacman -Rs"

# git
alias gls="git ls-files"
alias gi="git init"
alias gb="git branch"
alias gp="git push"
alias gl="git log --graph --oneline"
alias gf="git fetch"
alias gs="git status -s"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias ga="git add"
alias gA="git add -A"
alias gundo="git reset HEAD~"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias config_update='config add -u; config commit -m"$(date) update"; config push'

# rust alternatives
alias cat="bat -p"
alias ls="clear;exa -laa --group-directories-first"
alias f='sk --preview "bat -p {1}" --bind "enter:execute(nvim {1})"'
alias zz='cd $(sk --preview "ls {1}")'

function edit() {
	file=$(config ls-tree -r main --name-only | fzf)
	if [[ -f $file ]]
	then
	$EDITOR $file
	fi
}

export TERMINAL=alacritty
export EDITOR=helix
export VISUAL=helix
export BROWSER=firefox
export PAGER="bat -p"
export MANPAGER="$PAGER"
export BEMENU_SCALE=2
export BEMENU_OPTS="-i --fixed-height --counter always -p 'run:' -l 12 -c -B 1 -W 0.5 --tb #191724 --tf #e0def4 --bdr #9ccfd8 --nb #191724 --nf #6d6a86 --af #6d6a86 --ab #191724 --hb #1f1d2e --hf #e0def4 --fb #191724 --fn 'mononoki Nerd Font 11'"

# path
export PATH=$PATH:${HOME}/.local/bin
# export PATH=$PATH:${HOME}/node_modules/.bin
# export PATH=$PATH:${HOME}/.nimble/bin

# evals
eval "$(zoxide init bash)"

# pnpm
export PNPM_HOME="/home/red/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
