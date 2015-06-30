# Class: profile::chronos
# Manage Chronos installation, configuration, and jobs
#
class profile::chronos {
  $hostname = hiera('profile::chronos::hostname', $::hostname)
  $jobs     = hiera('profile::chronos::jobs', false)

  class { '::chronos':
    hostname            => $hostname,
    manage_package_deps => false,
    require             => Class['profile::mesos::master'],
  }

  if $jobs != false {
    validate_hash($jobs)
    create_resources('chronos_job', $jobs)
  }
}
