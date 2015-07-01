Vagrant.configure(2) do |config|
  config.vm.box = 'puppetlabs/centos-7.0-64-puppet'

  # Mesos master
  config.vm.define 'mesos-master' do |c|
    c.vm.host_name = 'mesos-master'
    c.vm.network 'private_network', :ip => '192.168.248.10'
  end

  # Mesos slaves
  (1..3).each do |i|
    config.vm.define "mesos-slave-#{i}" do |c|
      c.vm.host_name = "mesos-slave-#{i}"
      c.vm.network 'private_network', :ip => "192.168.248.1#{i}"
    end
  end

  # Puppet will return a non-zero exit code if there's a problem with the run,
  # which includes the possibility that the chronos_job provider isn't
  # available on the first run (because Puppet also manages the httparty gem).
  #
  # To work around this, we call a provision script that always exits 0. This
  # isn't entirely necessary, but is a nice-to-have so that a simple
  # `vagrant up` provisions the entire demo environment in one shot.
  config.vm.provision :shell, inline: '/vagrant/scripts/provision.sh'

  # Ensure everything has at least 1 GB RAM, across the three common providers
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus   = 1
  end
  config.vm.provider 'vmware_fusion' do |v|
    v.vmx['memsize']  = '1024'
    v.vmx['numvcpus'] = '1'
  end
  config.vm.provider 'vmware_workstation' do |v|
    v.vmx['memsize']  = '1024'
    v.vmx['numvcpus'] = '1'
  end
end
