#!/usr/bin/env zsh

# Mimic bash `history`
alias history='history -E 1'

# ZSH history settings

# file
# shellcheck disable=SC2154
test -d "$XDG_DATA_HOME"/zsh || mkdir -p "$XDG_DATA_HOME"/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Size
export HISTSIZE=1048576
export SAVEHIST=$HISTSIZE

# Add timestamp
setopt EXTENDED_HISTORY
# Set imestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
HISTTIMEFORMAT='%F %T '

#setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Append
#setopt INC_APPEND_HISTORY

# Avoid duplicates
#setopt HIST_FIND_NO_DUPS

# Prevent particular entries from being recorded into a history by preceding them with at least one spaces
#setopt hist_ignore_space

## Iignore
#HISTIGNORE='&:ls:cd ~:cd ..:pwd:clear:[bf]g:exit:h:history'


