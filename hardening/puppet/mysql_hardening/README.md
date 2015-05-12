TODO
puppetlabs/myssql: due to no support for ubuntu 15 (replaced upstart with systemd) this script only makes sure if mysql is installed, and installs it if it isnt from the package manager.

It exetues all commands on the mysql shell. Thus it should run on all systems with a workin mysql shell.