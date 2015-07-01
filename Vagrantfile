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

  # Provision everything with Puppet
  config.vm.provision :puppet do |pp|
    pp.options        = '--hiera_config /vagrant/hiera.yaml --parser future'
    pp.manifests_path = 'manifests'
    pp.module_path    = ['modules', 'vendor/modules']
    pp.manifest_file  = 'base.pp'
  end

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
