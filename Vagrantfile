# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  #config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [
    ".git/",
    "vendor/bundle"
  ]

  config.vm.define :imap do |c|
    c.vm.network :private_network, ip: '192.168.33.10'
    c.vm.hostname = :imap01
    config.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 512]
      vbox.customize ["modifyvm", :id, "--cpus", 2]
    end
  end
end
