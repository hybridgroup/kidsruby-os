name "livecd"
description "The ubuntu-mini-remix chroot remastering environment"
run_list(
  "role[base]",
  "role[ubuntu]"
)