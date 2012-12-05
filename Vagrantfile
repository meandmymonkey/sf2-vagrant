# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.customize ["modifyvm", :id, "--memory", 1024]
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.network :hostonly, "33.33.33.100"
    # remove the next line when running on a windows host system (Windows does not have NFS support)
    config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "app.pp"
    end

    config.vm.provision :shell, :inline => "echo 'It works! <?php echo date(DATE_RFC822); ?>' > /vagrant/project/web/index.php"
end
