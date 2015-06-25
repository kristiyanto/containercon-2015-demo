# Class: profile::mesos::master
# Provision an Apache Mesos master
#
class profile::mesos::master {
  $env_vars       = hiera('profile::mesos::master::env_vars', {})
  $listen_address = hiera('profile::mesos::master::listen_address', $::ipaddress)
  $options        = hiera('profile::mesos::master::options', {})
  $work_dir       = hiera('profile::mesos::master::work_dir', '/var/lib/mesos')

  validate_hash($env_vars)
  validate_hash($options)

  require profile::mesos::common

  class { '::mesos::master':
    env_var        => $env_vars,
    listen_address => $listen_address,
    options        => $options,
    work_dir       => $work_dir,
  }
}
