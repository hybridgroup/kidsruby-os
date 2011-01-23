name "base"
description "The base role for all nodes"
run_list(
  "recipe[git]",
  "recipe[bashrc]"
)