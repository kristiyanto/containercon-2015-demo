# Class: profile::mesos::common
# Resources used by both profile::mesos::master and profile::mesos::slave
#
class profile::mesos::common {
  $version   = hiera('profile::mesos::common::version')
  $zookeeper = hiera('profile::mesos::common::zookeeper')

  class { '::mesos':
    repo           => 'mesosphere',
    listen_address => $::ipaddress,
    version        => $version,
    zookeeper      => $zookeeper,
  }
}
