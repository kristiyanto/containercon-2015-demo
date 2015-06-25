# Class: role::mesos::master
# Provision an Apache Mesos master, complete with ZooKeeper and Chronos
#
class role::mesos::master {
  include profile::base
  include profile::chronos
  include profile::mesos::master
  include profile::zookeeper

  # Ensure profile::zookeeper is applied before profile::mesos::master
  Class['profile::zookeeper'] -> Class['profile::mesos::master']
}
