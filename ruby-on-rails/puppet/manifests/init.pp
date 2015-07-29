# == Class: ruby_on_rails
#
# === Parameters
#
# [*server_dir*]
# Der Rails Server Directory. Options: `String` 
#
# [*ruby_version*]
# The Version of Ruby which will be installed. Options: `String`; default: `2.2.2`
#
# [*bash_file*]
# the bash init file. Options: `String`; defaults: `.bashrc`


class mysql_hardening (
    $server_dir = '/tmp/rails_test',
    $ruby_version = '2.2.2',
    $bash_file = '.bashrc',
)
$path = "/usr/:/bin/:/sbin/:/usr/sbin:/usr/bin/:/root/.rbenv/bin" 
$enhancers = [ "make", "patch","nodejs","git","curl","gcc", "sqlite3","libsqlite3-dev","zlib1g-dev","libssl-dev","libreadline-dev"  ]

Package { $enhancers: ensure => "installed" }

exec { "InstallRbenv":
                command => 'curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash',
                path => $path
    }


exec { "InstallRbenvEnv":
                command => 'eval "\$(rbenv init -)"',
                path => $path
    }

exec { "add_com_to_env":
                command => 'echo \'export PATH="$HOME/.rbenv/bin:\$PATH"\' >> ~/$bash_file; echo \'eval "\$(rbenv init -)"\' >> ~/$bash_file',
                path => $path
    }
exec { "install_ruby":
                command => 'rbenv install -s $ruby_version',
                path => $path
    }

exec { "ruby_version_global":
                command => 'rbenv global $ruby_version',
                path => $path
    }

file { "$server_dir":
    ensure => "directory",
    recurse => true,
    purge => true,
    force => true
}

exec { "install_rails":
                command => 'rbenv exec gem install rails --no-ri --no-rdoc',
                path => $path
    }

exec { "install_sqlite":
                command => ,
                path => $path
    }

exec { "create_new_ror_app":
                command => ,
                path => $path
    }

exec { "start_ror_server":
                command => ,
                path => $path
    } 

