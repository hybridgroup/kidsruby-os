execute "copy resolv.conf to the chroot" do
  command "cp /etc/resolv.conf /root/tmp/remaster-root/resolv.conf"
end

execute "place resolv.conf within the chroot" do
  command "`which chroot` /root/tmp/remaster-root /bin/bash -c 'mv /resolv.conf /etc/resolv.conf'"
end

# setup the chef bootstrap file inside the chroot
cookbook_file "/root/tmp/remaster-root/chef-bootstrap.sh" do
  source "chef-bootstrap.sh"
  owner  "root"
  group  "root"
  mode   0644
  action :create
end

execute "Bootstrap Chef in the chroot" do
  command "`which chroot` /root/tmp/remaster-root /bin/bash -c 'sh /chef-bootstrap.sh'"
end

# copy the host chef configuration to the chroot
execute "Copy Chef to the chroot" do
  command "cp -R /tmp/vagrant-chef /root/tmp/remaster-root/vagrant-chef"
end

execute "update chef configuration paths in the chroot" do
  command [
    "sed -i 's/\\/tmp//g' /root/tmp/remaster-root/vagrant-chef/solo.rb",
    "sed -i 's/role\\[vm_host\\]/role\\[livecd\\]/' /root/tmp/remaster-root/vagrant-chef/dna.json"
  ].join(" && ")
end

execute "run chef within the chroot" do
  command "`which chroot` /root/tmp/remaster-root /bin/bash -c 'chef-solo -c /vagrant-chef/solo.rb -j /vagrant-chef/dna.json'"
end