#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
export ZDOTDIR="$HOME/.config/zsh"
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
#GoLang
export GOPATH="$HOME/ProgramFiles/go"
#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/completion.zsh.inc'; fi
