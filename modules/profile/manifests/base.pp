# Class: profile::base
# Base resources that should be present on every node
#
class profile::base {
  package { ['git', 'ruby', 'ruby-devel', 'vim-enhanced']:
    ensure => present,
  }

  # For the purposes of this demo, disable the firewall
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
}
