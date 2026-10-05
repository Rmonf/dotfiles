#
# ~/.bashrc
#

#  DEFAULTS  #
##############

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#  LOAD FILES  #
################

# Add .bashrc_secret if existent
if [ -f ~/.bashrc_secret ]; then
    source ~/.bashrc_secret
fi

#  ALIASES  #
#############

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'		# Shortcut to dotfiles repo

#  FUNCTIONS  #
###############

# Official function for yazi to drop you off at its latest terminal
function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}
