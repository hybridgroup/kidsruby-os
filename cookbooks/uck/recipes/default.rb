#
# Cookbook Name:: uck
# Recipe:: default
#

template "/etc/apt/sources.list.d/uck.list" do
  mode 0644
  variables :code_name => node[:lsb][:codename]
  notifies :run, resources(:execute => "apt-get update"), :immediately
  source "uck.list.erb"
end

package "uck" do
  options "--force-yes"
end