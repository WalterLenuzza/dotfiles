file.directory "cache" {
  destination = "{{param `prefix`}}/.cache"
  create_all  = true
}

file.directory "config" {
  destination = "{{param `prefix`}}/.config"
  create_all  = true
}

file.directory "data" {
  destination = "{{param `prefix`}}/.local/share"
  create_all  = true
}

file.content "xdg_user_locale" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/user-dirs.locale"
  content     = "{{param `locale`}}"
}

file.content "xdg_user_dirs" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/user-dirs.dirs"

  content = <<EOF
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
# 
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DEVEL_DIR="$HOME/Devel"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_VIDEOS_DIR="$HOME/Videos"
EOF
}
