Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class system-update {
  exec { 'apt-get update':
    command => 'apt-get update',
  }

  $sysPackages = [ "build-essential" ]
  package { $sysPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}

class apache {
  package { "apache2":
    ensure  => present,
    require => Class["system-update"],
  }

  service { "apache2":
    ensure  => "running",
    require => Package["apache2"],
  }

}

if $operatingsystem == 'Ubuntu' {
  notice('Cool! I like you')
}
elsif $operatingsystem == 'Windows' {
  warning('What the hell are you doing...')
}
else {
  notice("I dont know what to think about ${operatingsystem}. Its a ${osfamily}, isnt it?")
}

include apache
include system-update