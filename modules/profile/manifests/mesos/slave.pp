# Class: profile::mesos::slave
# Provision an Apache Mesos slave
#
class profile::mesos::slave {
  $env_vars       = hiera('profile::mesos::slave::env_vars', {})
  $listen_address = hiera('profile::mesos::slave::listen_address', $::ipaddress)
  $options        = hiera('profile::mesos::slave::options', {})
  $work_dir       = hiera('profile::mesos::slave::work_dir', '/var/lib/mesos')

  validate_hash($env_vars)
  validate_hash($options)

  require profile::mesos::common

  class { '::mesos::slave':
    env_var        => $env_vars,
    listen_address => $listen_address,
    options        => $options,
    work_dir       => $work_dir,
  }
}
