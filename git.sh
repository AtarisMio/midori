#!/bin/zsh -e

# 配置大小写敏感
git config --global core.ignorecase false

# 配置git alias

# git co = git checkout
git config --global alias.co checkout
# git cm = git commit
git config --global alias.cm commit
# git cob = git checkout -b
git config --global alias.cob "checkout -b"
# git st = git status
git config --global alias.st status
# git ps = git push
git config --global alias.ps push
# git cp = git cherry-pick
git config --global alias.cp cherry-pick
# git psu = git push -u origin ${currentBranch}
git config --global alias.psu "\!git push -u origin \$(git branch | grep '*' | awk '{print \$2}')"
# git psf = git push --force-with-lease origin ${currentBranch}
git config --global alias.psf "\!git push --force-with-lease origin \$(git branch | awk -F\"*\" '{print \$2}')"
# git sup = git submodule sync && git submodule update --init --recursive
git config --global alias.sup "\!git submodule sync && git submodule update --init --recursive"