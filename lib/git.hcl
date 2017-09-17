file.directory "config" {
  destination = "{{param `prefix`}}/.config/git"
  create_all  = true
}

file.content "config" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/git/config"

  content = <<EOF
[credential]
  helper = store --file "{{param `prefix`}}/.config/git/credentials"

[core]
  excludesfile = "{{param `prefix`}}/.config/git/ignore"
  autocrlf = input
  whitespace = trailing-space,space-before-tab

[alias]
  d = diff HEAD --patch-with-stat --summary
  follow = log -p --follow --
  l = log --stat --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
  last = log --decorate=full --stat -1 HEAD
  s = status -sb
  undopush = push -f origin HEAD^:master
  unstage = reset HEAD --
  p = push origin HEAD:refs/for/master

[color]
  ui = true

[diff]
  renames = copies

[filter "lfs"]
  clean = git lfs clean %f
  smudge = git lfs smudge %f
  required = true

[gc]
  auto = 1

[merge]
  stat = true

[push]
  default = simple

[url "https://github.com"]
  insteadOf = git://github.com

EOF
}

file.content "credentials" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/git/credentials"

  content = <<EOF

EOF
}

file.content "ignore" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/git/ignore"

  content = <<EOF
# OS generated files
*~
._*
.DS_Store*
ehthumbs.db
Icon?
Thumbs.db
.thumb.png

# Vim
.*.sw[a-z]
*.un~
Session.vim

# Private keys
*.pem
EOF
}
