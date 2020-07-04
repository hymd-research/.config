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
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
setopt CLOBBER
# Customize to your needs...
autoload -Uz zmv
alias zmv="noglob zmv -W"
fpath=(/usr/local/share/zsh-completions $fpath)

# for Go
export PATH="/usr/local/opt/go@1.11/bin:$PATH"
# for openssl
export PATH="/usr/local/Cellar/openssl@1.1/1.1.1g/bin:$PATH"
# for direnv
eval "$(direnv hook zsh)"
# Load anyenv automatically by adding
# the following to ~/.zshrc:
eval "$(anyenv init -)"
# for pyenv
export SDKROOT="$(xcrun --show-sdk-path)"
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
eval "$(pyenv virtualenv-init -)"
