# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.customize ["modifyvm", :id, "--memory", 1024]

  config.vm.network :hostonly, "33.33.33.100"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "init.pp"
  end

  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true, :create => true)
end
