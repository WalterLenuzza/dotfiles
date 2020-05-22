# dotfiles
Accommodating idiosyncrasies

Inspired by https://github.com/alfunx/.dotfiles


## Setup Repository

Setup a bare git repository in your home directory. Bare repositories have no
working directory, so setup an alias to avoid typing the long command. Add the
git directory `~/.dotfiles/` to the gitignore as a security measure. Setup
remote and push. Hide untracked files when querying the status.

```bash
#!/usr/bin/env sh

# Be strict
set -uo pipefail

# Speed up script by not using unicode
export LC_ALL=C
export LANG=C

# Check if git command exists
command -v git >/dev/null 2>&1 || { \
  echo >&2 'git not installed. Aborting!'
  exit 1
}

DOTFILES_REPO_DIR="$XDG_DATA_HOME/dotfiles"
DOTFILES_GIT_URL='https://github.com/waltlenu/dotfiles'
DOTFILES_GIT_BRANCH='refactor'

if ! [ -d "$DOTFILES_REPO_DIR" ]; then
  mkdir -pv "$HOME/.local/share/dotfiles"
  DOTFILES_REPO_DIR="$HOME/.local/share/dotfiles"
fi

# Clone bare repository
git clone --bare --recursive -b "$DOTFILES_GIT_BRANCH" "$DOTFILES_GIT_URL" "$DOTFILES_REPO_DIR"

# Alias dotfiles to git
alias dotfiles="git --git-dir=$DOTFILES_REPO_DIR --work-tree=$HOME $@"

# Checkout branch
dotfiles checkout

# Omit git untracked files
dotfiles config --local status.showUntrackedFiles no
```
