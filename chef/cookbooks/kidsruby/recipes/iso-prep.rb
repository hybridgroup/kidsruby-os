execute "Clean the uck environment" do
  command "uck-remaster-clean"
  # not_if  { `mount | grep remaster | wc -l`.chomp == "1" }
end

execute "Unpack ISO" do
  command "uck-remaster-unpack-iso #{node[:vagrant][:directory]}/ubuntu-mini-remix-10.10-i386.iso"
  # not_if  { `mount | grep remaster | wc -l`.chomp == "1" }
end

execute "Continue to unpack the rootfs." do
  # Ubuntu iso unpacks the result will be put in ~/tmp
  command "uck-remaster-unpack-rootfs"
  # not_if  { `mount | grep remaster | wc -l`.chomp == "1" }
end

execute "Mount the rootfs chroot" do
  command "uck-remaster-chroot-rootfs"
  # not_if  { `mount | grep remaster | wc -l`.chomp == "1" }
end