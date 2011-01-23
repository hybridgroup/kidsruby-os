name "ubuntu"
description "The base role for all Ubuntu Linux nodes"
run_list(
  "recipe[apt]",
  "recipe[build-essential]"
)