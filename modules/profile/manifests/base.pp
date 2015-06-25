# Class: profile::base
# Base resources that should be present on every node
#
class profile::base {
  package { ['git', 'vim-minimal']:
    ensure => present,
  }

  # For the purposes of this demo, disable the firewall
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
}
