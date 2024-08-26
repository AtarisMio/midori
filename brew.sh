#!/bin/zsh -e

# from brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install rosetta
softwareupdate --install-rosetta --agree-to-license

UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ "${UNAME_MACHINE}" == "arm64" ]]
then
  HOMEBREW_BIN='/opt/homebrew/bin/brew'
else
  HOMEBREW_BIN='/usr/local/bin/brew'
fi

(echo; echo "eval \"\$($HOMEBREW_BIN shellenv)\"") >> ~/.zprofile
eval "$($HOMEBREW_BIN shellenv)"

cat brew-casks.conf | xargs brew install --cask

cat brew-apps.conf | xargs brew install

echo 'add envs'

cat << \EOF >> ~/.zshrc

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

EOF

echo 'tmux config'

cp ./tmux.conf ~/.tmux.conf
