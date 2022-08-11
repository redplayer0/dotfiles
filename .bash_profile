#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# XDG specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

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

# Android
export ANDROID_HOME=$HOME/.android/
export ANDROID_SDK_ROOT=$HOME/.android/
export PATH=$PATH:$ANDROID_HOME/android_sdk/cmdline-tools/bin
export PATH=$PATH:$ANDROID_HOME/android_sdk/platform-tools
export PATH=$PATH:$ANDROID_HOME/android_sdk/emulator/

export PROMPT_COMMAND="history -a"

# gpg agent for ssh
# export GPG_TTY=$(tty)
# gpg-agent-connect /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# xdg-ninja exports to unclutter the home dir
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Executes
startx
