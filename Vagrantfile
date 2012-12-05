# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.customize ["modifyvm", :id, "--memory", 1024]

    config.vm.network :hostonly, "33.33.33.100"

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "app.pp"
    end

    config.vm.provision :shell, :inline => "echo 'It works! <?php echo date(DATE_RFC822); ?>' > /vagrant/project/web/index.php"
    # install local composer.phar
    config.vm.provision :shell, :inline => "curl -s http://getcomposer.org/installer | php"
    # provides global composer.phar
    config.vm.provision :shell, :inline => "mv ./composer.phar /usr/bin/composer.phar"
end
