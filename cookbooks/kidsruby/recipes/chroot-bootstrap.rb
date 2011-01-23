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

# copy the host cookbooks to the chroot
execute "Copy Chef cookbooks to the chroot" do
  command "cp -R /tmp/vagrant-chef/cookbooks-0 /root/tmp/remaster-root/chef-cookbooks"
end