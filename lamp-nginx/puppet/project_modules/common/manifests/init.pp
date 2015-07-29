class common {
  # We need to run apt-get update first
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  ####
  # Install nginx
  ####
  class { 'nginx': }

  # Create vhost
  nginx::resource::vhost { 'dev.local':
    www_root => '/var/www/html',
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