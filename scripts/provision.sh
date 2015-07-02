#!/bin/bash

puppet apply /vagrant/manifests/base.pp \
    --hiera_config /vagrant/hiera.yaml \
    --parser future \
    --modulepath /vagrant/modules:/vagrant/vendor/modules

exit 0
