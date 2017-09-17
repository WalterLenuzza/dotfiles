file.directory "config" {
  destination = "{{param `prefix`}}/.config/bash"
  create_all  = true
}

file.directory "cache" {
  destination = "{{param `prefix`}}/.cache/bash"
  create_all  = true
}

task "bash_inputrc" {
  depends = ["file.content.bash_inputrc"]
  check   = "readlink {{param `prefix`}}/.inputrc"
  apply   = "ln -sf {{param `prefix`}}/.config/bash/inputrc {{param `prefix`}}/.inputrc"
}

file.content "bash_inputrc" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/bash/inputrc"

  content = <<EOF
# ~/.config/bash/inputrc
# Try to enable the application keypad when it is called.
# Some systems need this to enable the arrow keys.
set enable-keypad on

# CTRL-f, forward 1 word
"\C-f": forward-word
# CTRL-b, back 1 word
"\C-b": backward-word

# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Immediately add a trailing slash when autocompleting symlinks to directories
set mark-symlinked-directories on

# Use the text that has already been typed as the prefix for searching through
# commands (basically more intelligent Up/Down behavior)
"\e[B": history-search-forward
"\e[A": history-search-backward

# ctrl left, ctrl right for moving on the readline by word
"\e[1;5C": forward-word
"\e[1;5D": backward-word

# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
set match-hidden-files on

# Show all autocomplete results at once
set page-completions off

# If there are more than 200 possible completions for a word, ask to show them all
set completion-query-items 200

# Show extra file information when completing, like `ls -F` does
set visible-stats on

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
set skip-completed-text on

# Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
set input-meta on
set output-meta on
set convert-meta off

# Use Alt/Meta + Delete to delete the preceding word
"\e[3;3~": kill-word
EOF
}

task "bash_logout" {
  depends = ["file.content.bash_logout"]
  check   = "readlink {{param `prefix`}}/.bash_logout"
  apply   = "ln -sf {{param `prefix`}}/.config/bash/logout {{param `prefix`}}/.bash_logout"
}

file.content "bash_logout" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/bash/logout"

  content = <<EOF
# ~/.config/bash/logout: executed by bash(1) when login shell exits.
# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
EOF
}

task "bashrc" {
  depends = ["file.content.bashrc"]
  check   = "readlink {{param `prefix`}}/.bashrc"
  apply   = "ln -s {{param `prefix`}}/.config/bash/rc {{param `prefix`}}/.bashrc"
}

file.content "bashrc" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/bash/rc"

  content = <<EOF
# ~/.config/bash/rc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source common shell configuration
[ -f '{{param `prefix`}}/.config/shell/rc' ] && \
  . '{{param `prefix`}}/.config/shell/rc'

# Source temporary common shell configuration
[ -f '{{param `prefix`}}/.config/shell/scratchpad' ] && \
  . '{{param `prefix`}}/.config/shell/scratchpad'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# History file
HISTFILE='{{param `prefix`}}/.cache/bash/history'

# History size
HISTSIZE=32768

# History: avoid duplicates
HISTCONTROL=ignoredups:erasedups

# History: ignore
HISTIGNORE='&:ls:cd ~:cd ..:pwd:clear:[bf]g:exit:h:history'

# History timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
HISTTIMEFORMAT='%F %T '

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# Print pretty system logo/info (archey)
[ $(command -v neofetch) ] && neofetch

# Fortune
[ $(command -v fortune) ] && fortune computers science && echo

# Show today's anniversaries
[ $(command -v calendar) ] && [ -r /usr/share/calendar/calendar.world ] && {
  calendar -A 0 -f /usr/share/calendar/calendar.world; }

# PS2 – Continuation interactive prompt
PS2='  '

# PS4 - Prefix tracing output (set -x)
PS4='$0.$LINENO+ '

# Source external script for PS1 configuration
[ -f '{{param `prefix`}}/.config/bash/prompt' ] && \
  . '{{param `prefix`}}/.config/bash/prompt'

# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; #history -c; history -r"
EOF
}
