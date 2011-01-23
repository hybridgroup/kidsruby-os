execute "Pack the rootfs" do
  command "uck-remaster-pack-rootfs"
  # only_if { `mount | grep remaster | wc -l`.chomp == "1" }
end

execute "Pack new ISO" do
  command "uck-remaster-pack-iso #{node[:vagrant][:directory]}/KidsRuby-#{node[:kidsruby][:version]}.iso"
  # only_if { `mount | grep remaster | wc -l`.chomp == "1" }
end