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
# Install php, php-cli, php-fpm
####
class { 'php::fpm': }
class { 'php::cli': }
class { 'php::extension::apc': }

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

# TEST
include test