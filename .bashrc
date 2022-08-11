#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='[\u@\h \W]\$ '

# aliases
alias ls="ls -a -l --color --group-directories-first -o -g -p -v -h"
alias lsbin="ls $HOME/.local/bin;echo '--------------------';ls $HOME/bin"
alias c="clear"
alias ..="cd ./.."
alias path='echo $PATH | tr ":" "\n" | nl'
alias xprop="xprop | rg WM_CLASS"
alias lsblk="lsblk -f"
alias t2="clear;tree -L 2"

# programs
alias n="nnn -G"
alias vim="nvim"
alias r="ranger"
alias rc="ranger $HOME/.config"
alias steam2="GDK_SCALE=2 steam"
alias feh="feh -d"

# quick edits
alias profile="vim $HOME/.bash_profile"
alias bashrc="vim $HOME/.bashrc"
alias term="vim $HOME/.config/alacritty/alacritty.yml"
alias xinitrc="vim $HOME/.xinitrc"

# specific programs
alias addpass="pass insert -m"
# alias dl="yt-dlp -x --audio-format mp3 -o '/home/red/media/music/%(title)s.%(exts)s'"

# pacman
alias sy="sudo pacman -Sy"
alias syu="sudo pacman -Syu && packages"
alias qg="pacman -Q | grep $1"
alias qu="pacman -Qu"
alias qi="pacman -Qeq | sk --preview='pacman -Qi {}'"
alias qe="pacman -Qe | bat -p"
alias S="sudo pacman -S"
alias ss="pacman -Ss"
alias si="pacman -Ss | rg / | awk -F '/' '{print \$2}' | awk '{print \$1}' | sk --preview='pacman -Si {}' --bind 'enter:execute(sudo pacman --noconfirm -S {})'"
alias rs="sudo pacman -Rs"

# git
alias gi="git init"
alias gp="git push"
alias gl="git log --oneline"
alias gf="git fetch"
alias gs="git status -s"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias ga="git add -A"
alias gundo="git reset HEAD~"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# rust alternatives
alias pkglist="paru -Qttq > $HOME/.pkglist ; bat -p $HOME/.pkglist"
alias cargo-update="cargo-install-update install-update --all"
# alias htop="ytop"
alias cat="bat -p"
alias ls="clear;exa -laa --group-directories-first"
alias f='sk --select-1 --delimiter=/ --with-nth=-2..-1 --preview "bat -p {}" --bind "enter:execute(nvim {})"' 

shopt -s histappend

eval "$(zoxide init bash)"
eval "$(starship init bash)"
