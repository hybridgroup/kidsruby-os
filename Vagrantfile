Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "kidsruby"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant_main"

    # You may also specify custom JSON attributes:
    # chef.json = { :mysql_password => "foo" }
  end
end