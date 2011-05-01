name "ec2_host"
description "The AWS EC2 Build Host"
run_list(
  "recipe[aws]",
  "recipe[ec2]",
  "recipe[ec2::filesystems]",
  "role[base]",
  "role[ubuntu]",
  "recipe[uck]",
  "recipe[kidsruby_os]"
)