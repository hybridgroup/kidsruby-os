# prep the livecd iso environment
include_recipe "kidsruby::iso-prep"

# prepare the chroot for rebuild via chef
include_recipe "kidsruby::chroot-bootstrap"

# build the iso and cleanup
include_recipe "kidsruby::iso-build"