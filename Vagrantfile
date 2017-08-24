Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision :shell, inline: <<-SHELL
    sudo apt-get -y update
    sudo apt-get -y install make clisp
    printf "\n#login directory\ncd /vagrant\n" >> /home/vagrant/.profile
  SHELL
end
