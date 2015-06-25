# Class: profile::zookeeper
# Install and manage a ZooKeeper node
#
class profile::zookeeper {
  $id        = hiera('profile::zookeeper::id')
  $client_ip = hiera('profile::zookeeper::listen_ip', $::ipaddress)

  include ::java

  class { '::zookeeper':
    client_ip => $client_ip,
    id        => $id,
    repo      => 'cloudera',
    require   => Class['java'],
  }
}
