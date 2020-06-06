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
# for pyenv
export SDKROOT="$(xcrun --show-sdk-path)"
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

