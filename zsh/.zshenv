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
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
#GoLang
export GOPATH="$HOME/go"
export PATH="/usr/local/opt/go@1.11/bin:$PATH:$GOPATH/bin"
# for openssl
export PATH="/usr/local/Cellar/openssl@1.1/1.1.1g/bin:$PATH"
# for pyenv
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/path.zsh.inc' ]; then 
    . '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/path.zsh.inc'; 
fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/completion.zsh.inc' ]; then 
    . '/Users/syunsuke-hosoyamada/ProgramFiles/google-cloud-sdk/completion.zsh.inc'; 
fi
