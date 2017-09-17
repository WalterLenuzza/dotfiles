param "prefix" {
  default = "{{env `HOME`}}"
}

param "locale" {
  default = "en_GB"
}

param "shell" {
  default = "/bin/bash"
}

module "lib/xdg.hcl" "xdg" {}

module "lib/shell.hcl" "shell" {}

module "lib/bash.hcl" "bash" {}

module "lib/prompt.hcl" "prompt" {}

module "lib/git.hcl" "git" {}

module "lib/neovim.hcl" "neovim" {}

module "lib/xorg.hcl" "xorg" {}
