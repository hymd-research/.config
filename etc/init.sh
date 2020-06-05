#!/usr/local/bin/zsh

"$(dirname $0)"/requirements.sh

setopt EXTENDED_GLOB

for rcfile in "${HOME}"/.config/zsh/.??*; do
  [[ "${rcfile:t}" != ".zshenv" ]] && continue 
  ln -s "${rcfile}" "${HOME}/${rcfile:t}"
done
