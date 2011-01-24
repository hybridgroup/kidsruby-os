execute "Clean the uck environment" do
  command "uck-remaster-clean"
end

execute "Unpack ISO" do
  command "uck-remaster-unpack-iso #{node[:vagrant][:directory]}/ubuntu-mini-remix-10.10-i386.iso"
end

execute "Continue to unpack the rootfs." do
  # Ubuntu iso unpacks the result will be put in ~/tmp
  command "uck-remaster-unpack-rootfs"
end