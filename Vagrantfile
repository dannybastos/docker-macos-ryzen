Vagrant.configure('2') do |config|
  config.vm.box = "dannybastosbr/dockerVM"
  config.vm.box_version = "1.0.0"
  config.vm.hostname = 'docker.vm'
  # Configuration for Port Forwarding
  config.vm.network 'private_network', ip: '192.168.59.100'
  config.vm.network 'forwarded_port', guest: 2375, host: 2375, id: 'dockerd'
  config.vm.network 'forwarded_port', guest: 22, host: 2222, id: 'ssh'
  # Uncomment or add new ones here as required
  # config.vm.network 'forwarded_port', guest: 6379, host: 6379, id: 'redis'
  # config.vm.network 'forwarded_port', guest: 3306, host: 3306, id: 'mysql'
  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'dockerVM'
    vb.memory = '2048'
    vb.cpus = '2'
    vb.customize ["modifyvm", :id, "--audio", "none"]
  end
end
