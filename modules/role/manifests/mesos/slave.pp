# Class: role::mesos::slave
# Provision an Apache Mesos slave, complete with Docker
#
class role::mesos::slave {
  include profile::base
  include profile::docker
  include profile::mesos::slave

  # Ensure profile::docker is applied before profile::mesos::slave
  Class['profile::docker'] -> Class['profile::mesos::slave']
}
