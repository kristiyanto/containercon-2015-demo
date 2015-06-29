# Class: profile::chronos
# Manage Chronos installation, configuration, and jobs
#
class profile::chronos {
  Class['profile::mesos::master'] -> Class['chronos']
  include ::chronos
}
