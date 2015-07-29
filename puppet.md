# What is puppet?

Puppet is a tool used to manage and automate IT-Infrastructure. It uses its own declarative language to describe system configurations. 
It's written in python and distributed under the Apache License 2.0 (since version 2.8). Configurations can be written in puppet's declarative language or a 
ruby DSL (domain-specific language). Puppet exists in two versions: Open Source Puppet or Puppet Enterprise.

## Open Source Puppet

Open Source Puppet is the basic for Puppet Enterprise as described in ["What is Puppet?"](#what-is-puppet)

## Puppet Enterprise

Puppet Enterprise extends the basic Open Source Puppet by apps to make management and distribution of enterprise infrastructure easier. Some apps are i.e. used to
monitor, track, distribute and manage nodes.

# Setup Open Source Puppet

You can find the installation instructions in the [Open Source Puppet Documentation](http://docs.puppetlabs.com/guides/install_puppet/pre_install.html). To use Puppet for development
you need a tool like [Vagrant](https://www.vagrantup.com) to manage your virtual machines.

## Setup a local project

### Requirements

* [Vagrant](https://github.com/slipke/csm_ss15_sem_team_vagrant/blob/master/vagrant.md) is installed
* [RubyGems](https://rubygems.org) is installed

### Install Puppet

To install Puppet you can use the following command: `sudo gem install puppet`

### Install [librarian-puppet](https://github.com/rodjek/librarian-puppet)

To install the CLI tool [librarian-puppet](https://github.com/rodjek/librarian-puppet)  you can use the following command: `sudo gem install librarian-puppet`

### (Option 1) Install librarian-puppet to manage modules

- Run `librarian-puppet init` to create a _Puppetfile_
- Add metadata.json
- Add your dependencies into the file named _Puppetfile_
- Run `librarian-puppet install` to install the dependencies

### (Option 2) Use git submodules to manage modules

- Install [git](https://git-scm.com)
- Add a submodule with the command `git submodule add <repository-url> puppet/modules/<module-name>`

### (Option 3) Download modules manually

You can also manually download any module, i.e. from [Puppet forge](https://forge.puppetlabs.com).

# Architecture

## Agent/Master (Client/Server) Architecture

Puppet typically runs in a master/slave architecture, where the master server holds the configurations, which can requested by the slaves (nodes).
The nodes require the _Puppet Agent_ application to be installed, which typically runs in the background. 
The servers need the [_Puppet Server_](http://docs.puppetlabs.com/puppetserver/1.0/index.html) application, typically managed by a web-server as a rack application.
After a given time every node syncs with the Puppet master server by sending facts, and expects a compiled catalog as response.

## Puppet Apply

Puppet can also run in a standalone version, which is called _Puppet Apply_. _Puppet Apply_ periodically compiles the catalog (via i.e. a cron-job) and checks the current 
system for changes, and if needed applies them.

## Differences between agent/master &amp; puppet apply

- In puppet apply every node has access to the full knowledge
- Agent / master handles all reports centrally
- In puppet apply every node needs to be synced if a change on the manifests was made, in agent/master only the master server needs to be updated
- Puppet apply needs more resources (since all nodes have to compile their own catalog)
- Master/Slave need a big master server (lots of RAM and CPU) with a fast disk
- Agents need good network to reach master servers

## Compiling a catalog

The following steps are performed when a catalog is being compiled:

1. Retrieve the node object
2. Set Variables from the Node Object, from Facts, and from the Certificate
3. Evaluate the Main Manifest
3a. Load and Evaluate Classes from Modules
4. Evaluate Classes from the Node Object

# Components

## Catalog

A catalog describes a system state for a single node. It is compiled by the master server and requested by a node by sending the facts to the master.
It lists all resources and dependencies which need to be managed in a certain order.

## Files

Puppet files are called manifests and always end on _.pp_. They:

- Must be UTF-8 encoded
- May use Unix (LF) or Windows (CRLF) line breaks

Puppet always starts compiling with the [_main manifest_](https://docs.puppetlabs.com/puppet/latest/reference/dirs_manifest.html) file.

## Resources

A _resource_ describes some aspect of a system, i.e. a service that needs to be managed or a package that needs to be installed. 
A _resource declaration_ is a block of Puppet code, which describes the resource.

Sample:

```
# A resource declaration:
file { '/etc/passwd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
}
```

The syntax contains a type, a title and a set of attributes, where the type identifies what kind of resource it is, the title is unique string for the compiler
and the attributes describe the actual state of the resource.

```
type {'title':
    attribute => value,
}
```

## Classes

Classes are bigger named blocks of Puppet code which are only executed when they're called. They are stored in modules and can be added by declaring them.

```
# A class with parameters
class apache (String $version = 'latest') {
    package {'httpd':
        ensure => $version, # Using the class parameter from above
        before => File['/etc/httpd.conf'],
    }
    file {'/etc/httpd.conf':
        ensure  => file,
        owner   => 'httpd',
        content => template('apache/httpd.conf.erb'), # Template from a module
    }
    service {'httpd':
        ensure    => running,
        enable    => true,
        subscribe => File['/etc/httpd.conf'],
    }
}
```

A class consists of the `class` keyword, the name of the class, an optional parameter list and a block of Puppet code.

A class can be used by declaring it, which is possible in two ways:

- By using `include`, `require`, `contain` or `hiera_include`, which is called 'include-like behaviour'
- By declaring them like a resource, which is called 'resource-like behaviour'


## Node definitions

Node definitions contain code, which is only executed on one specific node.

```
# puppet/manifests/site.pp
node 'www1.example.com' {
    include common
    include apache
    include squid
}
node 'db1.example.com' {
    include common
    include mysql
}
```

# Modules

[Modules](http://docs.puppetlabs.com/puppet/4.1/reference/modules_fundamentals.html) are bundles of code and data. Every manifest file should be placed in a module, except the `main manifest`.

## Folder Structure

A [module](http://docs.puppetlabs.com/puppet/4.1/reference/modules_fundamentals.html) has the following directory structure:

- `my_module`
    - `manifests`
        - `init.pp` This file contains a class definition, which must be named after the module name.
        - `other_class.pp` Contains a class which is named `my_module::other_class`
        - `some_folder`
            - `foo.pp` Contains a class named `my_module::some_folder::foo`
    - `files` This folder contains static files needed by the nodes
        - `service.conf` This file's `source =>` would be `puppet:///modules/my_module/service.conf`, its content can be accessed by the `file` function (`content => file('my_module/service.conf')`)
    - `templates` This folder contains [templates](http://docs.puppetlabs.com/guides/templating.html) which can be used by the manifests
        - `component.erb` A template file which can be used by calling `template('my_module/component.erb')`
        - `component.epp` A template file which can be used by calling `epp('my_module/component.epp')`
    - `lib` This folder contains additional plugins
    - `facts.d` This folder contains [external facts](http://docs.puppetlabs.com/facter/latest/custom_facts.html#external-facts)
    - `examples` This folder contains examples on how the module should be used
        - `init.pp` 
    - `spec` Contains spec tests for any plugins in the lib directory
    
## How to use modules?

Modules can be found on multiple sources, the official repository from Puppetlabs is [Puppet Forge](https://forge.puppetlabs.com). Another source is [GitHub](https://github.com), where
different authors offer open soruce modules. A popular repository on GitHub is [Example42](https://github.com/example42).

Modules can either be downloaded manually (see [Option 3](#option-3-download-modules-manually), or automatically by either using a dependency manager like `librarian-puppet` (see [Option 2](#option-1-install-librarian-puppet-to-manage-modules)), or cloning 
from a GitHub repository (see [Option 2](#option-2-use-git-submodules-to-manage-modules))

## How to use librarian-puppet on windows

For the usage of librarian-puppet you have to install [Ruby](http://rubyinstaller.org/downloads/) on your Windows machine.
The librarian-puppet package needs also a puppet installation on the machine. This is also required, when you just want to download the puppet modules and install them on a guest system like a vagrant machine. It is possible that you will get SSL Authentication Errors when you start "librarian-puppet install". This is caused by non existent certificates. One fast workaround is to start your computer management and add a new envirment variable called "SSL_CERT_FILE" with the value of CHEFDK-HOME\embedded\ssl\certs\cacert.pem or download the file http://curl.haxx.se/ca/cacert.pem and point your path variable to this file.

# Resources

- [Core types cheat sheet](https://docs.puppetlabs.com/puppet_core_types_cheatsheet.pdf) 
- [Module cheat sheet](https://docs.puppetlabs.com/module_cheat_sheet.pdf)
- [Learning Puppet](http://docs.puppetlabs.com/learning/index.html)
- [Modules from Puppetlabs on GitHub](https://github.com/puppetlabs/)
- [Modules from Example42 on GitHub](https://github.com/example42/puppet-modules)
- [Puppet Forge](https://forge.puppetlabs.com)

# Sources

- [Puppetlabs](puppetlabs.com)
