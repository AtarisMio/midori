#!/bin/bash -e

# install git
xcode-select --install

bash ./zsh.sh
zsh brew.sh
zsh git.sh
