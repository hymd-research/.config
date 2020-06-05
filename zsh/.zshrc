#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
setopt CLOBBER

# Customize to your needs...
autoload -Uz zmv
alias zmv="noglob zmv -W"

# Load anyenv automatically by adding
# the following to ~/.zshrc:
eval "$(anyenv init -)"
# Load nodenv automatically by appending
# the following to ~/.zshrc:
eval "$(nodenv init -)"
# Load pyenv automatically by appending
# the following to ~/.zshrc:
eval "$(pyenv init -)"

