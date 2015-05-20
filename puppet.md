
@@@ WIP @@@

# What is puppet?

Puppet is a tool used to manage and automate IT-Infrastructure. It uses its own declarative language to describe system configurations. 
It's written in python and distributed under the Apache License 2.0 (since version 2.8). Configurations can be written in puppet's declarative language or a 
ruby DSL (domain-specific language). Puppet exists in two versions: Open Source Puppet or Puppet Enterprise.

## Open Source Puppet

Open Source Puppet is the basic for Puppet Enterprise as described in "What is Puppet?"

## Puppet Enterprise

Puppet Enterprise extends the basic Open Source Puppet by Apps to make management and distribution of enterprise infrastructure easier. Some apps are i.e. used to
monitor, track, distribute and manage nodes.

# Setup Open Source Puppet

You can find the installation instructions in the [Open Source Puppet Documentation](http://docs.puppetlabs.com/guides/install_puppet/pre_install.html). To use Puppet for development
you need a tool like [Vagrant](https://www.vagrantup.com) to manage your virtual machines.

## Setup a local project

- Create puppet folder
- Create puppet/manifest folder
- Create puppet/manifest/default.pp
- Create puppet/modules folder

### (Option 1) Install librarian-puppet to manage modules

- Run `librarian-puppet init` to create a _Puppetfile_
- Add metadata.json
- Add your dependencies into the file named _Puppetfile_
- Run `librarian-puppet install` to install the dependencies

### (Option 2) Use git submodules to manage modules

- Install [git](https://git-scm.com)
- Add a submodule with the command `git submodule add [repository-url] puppet/modules/[module-name]`

### (Option 3) Download modules manually

You can also manually download any module, i.e. from [Puppet forge](https://forge.puppetlabs.com)

# Architecture

## Agent/Master (Client/Server) Architecture

Puppet typically runs in a master/slave architecture, where the master server holds the configurations, which can requested by the slaves (nodes).
The nodes require the _Puppet Agent_ application to be installed, which typically runs in the background. 
The servers need the [_Puppet Server_](http://docs.puppetlabs.com/puppetserver/1.0/index.html) application, typically managed by a web-server as a rack application.
After a given time every node syncs with the puppet master server by sending facts, which expects a compiled catalog as response.

## Puppet Apply

Puppet can also run in a standalone version, which is called _Puppet Apply_. _Puppet Apply_ periodically compiles the catalog (via i.e. a cron-job) and checks the current system for changes, and if needed applies
them.

## Differences between agent/master &amp; puppet apply

- In puppet apply every node has access to the full knowledge
- Agent / master handles all reports centrally
- In puppet apply every node needs to be synced if a change was made, in agent/master only the master server needs to be updated
- Puppet apply needs more resources (since all nodes have to compile their own catalog)
- Master/Slave need a big master server (lots of RAM and CPU) with a fast disk
- Agents need good network to reach master servers

## Compiling a catalog

1. Retrieve the node object
2. Set Variables from the Node Object, from Facts, and from the Certificate
3. Evaluate the Main Manifest
3a. Load and Evaluate Classes from Modules
4. Evaluate Classes from the Node Object

# Components

## Catalog

A catalog describes a system state for a single node. It is compiled by the master server and requested by sending the facts to the master.
It lists all resources and dependencies which need to be managed in a certain order.

## Files

Puppet files are called manifests and always end on _.pp_. They must be:

- UTF-8 encoded
- May use Unix (LF) or Windows (CRLF) line breaks

Puppet always starts compiling with the _main manifest_ file.

## Resources

A _resource_ describes some aspect of a system, i.e. a service that needs to be managed or a package that needs to be installed. 
A _resource declaration_ is a block of puppet code, which describes the resource.

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

## Nodes

## Ordering

# Modules

http://docs.puppetlabs.com/puppet/3.7/reference/modules_fundamentals.html

## Where to get modules from?

- Puppet forge
- Git clone
- librarian-puppet

# Deprecation

- Relative resolution of class names
- Node inheritance
- Import
- ~= against non-string values
- search
- Variables with capital letters
- Class names can contain hyphens
- Mutation of arrays/hashes
- ruby DSL .rb

# Future

http://docs.puppetlabs.com/puppet/3.7/reference/experiments_future.html

# Resources

https://docs.puppetlabs.com/puppet_core_types_cheatsheet.pdf
https://docs.puppetlabs.com/module_cheat_sheet.pdf

Resources:
http://docs.puppetlabs.com/learning/index.html
Modules: https://github.com/puppetlabs/
Modules: https://github.com/example42/puppet-modules

# Sources

puppetlabs.com