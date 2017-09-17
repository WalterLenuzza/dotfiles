file.directory "config" {
  destination = "{{param `prefix`}}/.config/fonts"
  create_all  = true
}

file.directory "fonts" {
  destination = "{{param `prefix`}}/.local/share/fonts"
  create_all  = true
}

file.fetch "monospace_font" {
  depends     = ["file.directory.fonts"]
  source      = "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete.ttf"
  destination = "{{param `prefix`}}/.local/share/fonts/monospace.ttf"
  hash_type   = "sha256"
  hash        = "00d3090cfa77c6c80f7305702a92e531185c1812564f69b094b6d6ea8beed846"
}

