# make sure the customization-scripts directory exists
directory "/root/tmp/customization-scripts" do
  owner  "root"
  group  "root"
  action :create
end

# setup bootstrap files inside the chroot
%w[chroot-bootstrap.sh chef-bootstrap.sh].each do |file|
  cookbook_file "/root/tmp/customization-scripts/#{file}" do
    source file
    owner  "root"
    group  "root"
    mode   0755
    action :create
  end
end

# copy the host chef configuration to the chroot
execute "Copy Chef to the chroot" do
  command [
    "rm -rf /root/tmp/customization-scripts/vagrant-chef",
    "cp -R /tmp/vagrant-chef /root/tmp/customization-scripts/vagrant-chef"
  ].join(" && ")
end

# update paths and role for chroot
execute "update chef configuration paths in the chroot" do
  command [
    "sed -i 's/\\/tmp/\\/tmp\\/customization\-scripts/g' /root/tmp/customization-scripts/vagrant-chef/solo.rb",
    "sed -i 's/role\\[vm_host\\]/role\\[livecd\\]/' /root/tmp/customization-scripts/vagrant-chef/dna.json"
  ].join(" && ")
end

execute "bootstrap and run chef within the chroot" do
  command "/root/tmp/customization-scripts/chroot-bootstrap.sh"
end