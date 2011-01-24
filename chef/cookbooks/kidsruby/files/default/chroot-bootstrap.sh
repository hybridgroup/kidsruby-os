#!/bin/bash

# Adapted from scripts by UCK - Ubuntu Customization Kit
# prep chroot, run chef, cleanup chroot

SELF=`basename $0`
REMASTER_HOME=~/tmp

usage() {
  echo "Usage: $SELF [remaster-dir] [what-to-execute]"
  exit 1
}

failure() {
  echo "$SELF: $@" >&2
  exit 1
}

# Check arguments
if [ -n "$1" ]; then
  REMASTER_HOME="$1"; shift
fi
if [ -z "$1" ]; then
  set -- /bin/bash
fi

# Load common functionality, library requires
# REMASTER_HOME and REMASTER_DIR to be set!
REMASTER_DIR="$REMASTER_HOME/remaster-root"
. libraries/remaster-live-cd.sh 2>/dev/null ||
. /usr/lib/uck/remaster-live-cd.sh 2>/dev/null ||
failure "libraries not found"

# Prepare rootfs
prepare_rootfs_for_chroot "$REMASTER_HOME"

# bootstrap chef
chroot "$REMASTER_HOME/remaster-root" /bin/bash -c '/tmp/customization-scripts/chef-bootstrap.sh'

# run chef
chroot "$REMASTER_HOME/remaster-root" /bin/bash -c 'chef-solo -c /tmp/customization-scripts/vagrant-chef/solo.rb -j /tmp/customization-scripts/vagrant-chef/dna.json'

# clean rootfs
clean_rootfs_after_chroot "$REMASTER_HOME"

# That's all folks!
exit $status