# ContainerCon 2015 Demo
This repository contains demo materials for my ContainerCon 2015 talk
[Managing Mesos, Docker, and Chronos with Puppet](http://sched.co/3XpF),
co-presented with [Michael Hausenblas](http://mhausenblas.info/).

## Abstract
A solid configuration management solution is key to any well-run,
well-documented environment. Fortunately, Puppet can do more than just
host-bound configuration. In this presentation, Roger and Michael will
demonstrate how to build Docker images, deploy Apache Mesos clusters, and
create scheduled jobs in Chronos, all without leaving the Puppet DSL.

This presentation will demonstrate how you can use Puppet for
  * Deploying Mesos clusters on-premise and in the cloud
  * Building Docker containers declaratively
  * Creating Chronos jobs that make use of Docker containers

## Overview
This repository contains a Vagrant environment that will provision a single
Mesos master running ZooKeeper and Chronos, and three Mesos slaves running
Docker.

It will stage an
[example Docker image](https://gist.github.com/rji/9f3ffe85f40e6c592bf2)
on the Mesos slaves, to reduce the start-up time of Chronos tasks.

It will then create a Chronos job that runs a command within the Docker
container.

### How this repo is organized
This demo makes use of the roles and profiles pattern in Puppet. Essentially,
this breaks down to:
  * Each machine is assigned a single "role" (via Hiera)
  * Each role is made up of multiple "profiles"
  * Each profile contains resources and calls to other Puppet modules,
  and are responsible for actually configuring the machine

The roles and profiles are located in the `modules/` directory.

## Prerequisites
This demo was developed and tested using
  * Mac OS X 10.10.3
  * [Vagrant](https://www.vagrantup.com) 1.7.2
  * Ruby 2.1.5 with Bundler 1.7.6

## Usage
Install the required Ruby gems

```
$ bundle install
```

Download the Puppet modules required to provision the Razor server

```
$ bundle exec librarian-puppet install
```

Bring up the environment

```
$ vagrant up --provider virtualbox
```

_Note: each of the VMs are assigned 1 CPU core and 1 GB memory, so you should
have (at a minimum) 2 CPUs and 4 GB memory to run the full demo. Alternately,
you may use Vagrant to bring up just the `mesos-master` machine, and then one
or more `mesos-slave-N` machines._

Mesos will now be available at <http://192.168.248.10:5050> and Chronos will
be available at <http://192.168.248.10:4400>. If all is well, a Chronos job
named "query_mesos" will have been created and be visible in the Chronos UI.
