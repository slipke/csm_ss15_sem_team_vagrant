class common {
  # Run apt-get update first
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  ###
  # Install apache
  ###
  class { 'apache':  }

  # Install a vhost
  apache::vhost { 'dev.local':
    port    => '80',
    docroot => '/var/www/html',
  }

  ####
  # Install php
  ####
  include ::php

  ####
  # Install mysql
  ####
  class { '::mysql::server':
    root_password => 'root',
    databases => {
      'test' => {
        ensure  => 'present',
        charset => 'utf8',
      },
    },
  }
}