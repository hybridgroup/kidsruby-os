# Set ISO version
export KIDSRUBY_VERSION=`cat VERSION`

# Add uck ppa repository
sudo add-apt-repository ppa:uck-team/uck-stable
sudo apt-get update

# Install uck
sudo apt-get install uck

# Clean the uck environment
sudo uck-remaster-clean

# Unpack ISO
sudo uck-remaster-unpack-iso ubuntu-mini-remix-10.10-i386.iso

# Ubuntu iso unpacks the result will be put in ~/tmp
# Continue to unpack the rootfs.
sudo uck-remaster-unpack-rootfs

# To customize the iso and add packages you need to go inside the rootfs (~/tmp/remaster-root/)
# So apply following command to chroot
sudo uck-remaster-chroot-rootfs

# Now you are inside the rootfs and you can customize the system.

# First of all open the file /etc/apt/sources.list
# and uncomment the repository universe

# Update the available package list
sudo apt-get update

# Now we procede to install the desktop environment
echo Y | apt-get install xfce4 xdm

# Install some required libraries
sudo apt-get install binutils sudo

# Clean some unused packages
sudo apt-get autoclean

# Delete the deb package in cache
sudo rm /var/cache/apt/archives/*.deb

# Exit from chroot environment
exit

# Pack the rootfs
sudo uck-remaster-pack-rootfs

# Pack new ISO
sudo uck-remaster-pack-iso KidsRuby-$KIDSRUBY_VERSION.iso