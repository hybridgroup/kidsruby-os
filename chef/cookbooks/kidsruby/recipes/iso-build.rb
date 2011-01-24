execute "Pack the rootfs" do
  command "uck-remaster-pack-rootfs"
end

execute "Pack new ISO" do
  command "uck-remaster-pack-iso #{node[:vagrant][:directory]}/KidsRuby-#{node[:kidsruby][:version]}.iso"
end