#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Variables
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser
export PAGER="bat -p"
export MANPAGER="$PAGER"

# Program specific
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG="p:preview-tui"

# Appearance
export QT_STYLE_OVERRIDE=kvantum
export QT_SCALE_FACTOR=2
# export NVIM_GTK_NO_HEADERBAR=1
# export NVIM_GTK_NO_WINDOW_DECORATION=1

export GDK_DPI_SCALE=2

# Path
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH=$GEM_HOME/bin:$PATH
export PATH=$PATH:${HOME}/.local/bin
export PATH=$PATH:${HOME}/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/node_modules/.bin/

export PROMPT_COMMAND="history -a"

# gpg agent for ssh
# export GPG_TTY=$(tty)
# gpg-agent-connect /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Executes
startx
