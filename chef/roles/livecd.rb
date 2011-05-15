name "livecd"
description "The ubuntu-mini-remix chroot remastering environment"
run_list(
  "role[base]",
  "role[ubuntu]",
  "recipe[xfce4]",
  "recipe[cmake]",
  "recipe[libqt4]",
  "recipe[wifi-networking]",
  "recipe[gosu]",
  "recipe[rvm]",
  "recipe[kidsruby]",
  "recipe[virtualbox]"
)