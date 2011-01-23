name "vm_host"
description "The VirtualBox Vagrant host"
run_list(
  "role[base]",
  "role[ubuntu]",
  "recipe[uck]",
  "recipe[kidsruby]"
)