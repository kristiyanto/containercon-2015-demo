# Class: profile::docker
# Manage Docker configuration and images on a node
#
class profile::docker {
  $images  = hiera('profile::docker::images')

  validate_array($images)

  class { '::docker':
    manage_kernel => false,
  }

  # Create docker::image resources, which is equivalent to `docker pull $image`
  # This effectively allows Docker images to be staged on a host, ready for use
  $images.each |$image| {
    docker::image { $image:
      ensure => present,
    }
  }
}
