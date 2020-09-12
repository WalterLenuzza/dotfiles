#!/usr/bin/env sh

# Shared shell settings (bash/zsh)
# Basic prompt

# Prompt
PS1='[\u@\h \W]\$ '
#PS1="[\!]\[\033[1;25m\][\t]\[\033[1;33m\]\u\[\033[0m\]@\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\H\[\033[0m\]:\[\033[1;25m\]<\w>\[\033[0m\]# "

# PS2: continuation interactive prompt
PS2='  '

# PS4: prefix tracing output (set -x)
PS4='$0.$LINENO+ '