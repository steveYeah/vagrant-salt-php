Vagrant.configure("2") do |config|
  config.vm.box = "chef/debian-7.4-i386"
  config.vm.network "public_network"

  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  config.vm.provision :salt do |salt|

      salt.minion_config = "salt/minion"
      salt.run_highstate = true

  end
end