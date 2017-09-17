file.directory "xorg" {
  destination = "{{param `prefix`}}/.config/xorg"
  create_all  = true
}

file.directory "bspwm" {
  destination = "{{param `prefix`}}/.config/bspwm"
  create_all  = true
}

file.directory "compton" {
  destination = "{{param `prefix`}}/.config/compton"
  create_all  = true
}

file.directory "polybar" {
  destination = "{{param `prefix`}}/.config/polybar"
  create_all  = true
}

module "xorg/fontconfig.hcl" "fontconfig" {
  depends     = ["file.directory.xorg"]
}

module "xorg/xconfig.hcl" "xconfig" {
  depends     = [
    "file.directory.xorg",
    "module.fontconfig"
  ]
}

module "xorg/bspwm.hcl" "bspwm" {
  depends     = ["file.directory.bspwm"]
}

module "xorg/compton.hcl" "compton" {
  depends     = ["file.directory.compton"]
}

module "xorg/polybar.hcl" "polybar" {
  depends     = ["file.directory.polybar"]
}

