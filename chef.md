

# What is Chef?

Chef is a tool for automatic system configuration and management. Users can write "recipes" in a Ruby-DSL to describe how the final system should look like. These recipes can be written on lots of platforms regardless of the target's system operating system. Since v11 the core api is completely written in Erlang. 

# Get Chef up an running

## Get Chef
To use Chef, it is recommended to use the Chef Development Kit, where all neccessary tools are already bundled.
You can get it from [here](https://downloads.chef.io/chef-dk/). Download the version coresponding to the Platform you want to develop your recipes.
##Use Chef
As Chef is a command-line tool, basic knowledge of terminal commands is recommended but aside from `mkdir`, `cd` and creating files there's not much you have to do via the command-line. 

# Chef terminology

## Resources
In Chef a resource describes some piece of infrastructure, like a file, a template or a package.
The simplest kind of a resource is a single file. The resources describe what the system should look like but not how to get there.

## Recipe
A recipe is a collection of resources that describe a particular configuraton. A recipes contains all important information about how to configure a part of the system, e.g. which files should be created or which packages should be installed.

## Cookbook
In a cookbook, recipes are grouped together to make them more manageable and maintainable than just single recipes.

## Role
A role can contain multiple cookbooks to serve for a specific purpose e.g. a Web-Server, a Build-Server...

# Architecture

## Workstation
The workstation is the computer you use everyday. From this machine you can create, edit and manage your cookbooks and recipes. The platform of your workstation can be any OS with Chef being available. That means you can manage a Ubuntu Server from your Windows workstation.

## Server
The Chef Server hosts your cookbooks to make them available for multiple clients. It is basically your main repository for cookbooks. The Chef Server interacts with the nodes and supplies them with the latest cookbooks.


## Node
Any computer managed by the Chef Server is considered a node. Chef client needs to be installed on this computers but that is the only requirement to configure these machines.


## Chef-Solo
Chef-solo is an open source implementation of the Chef-client. With Chef-solo you can manage a single node without having to access the Chef Server. It requires the cookbooks an dependencies to be on the same physical disk as the node. It is very useful if you want to manage just a single computer for special tasks.
As an alternative you can run chef since v11.8 in local-mode by using `chef-client --local-mode`

## Directory Structure
  - `chef-repo`
    - `cookbooks` // used to store the cookbooks which configure the system
    - `data_bags` // used to store data bags which are global variables stored as JSON-data that can be accessed from the Chef Server an be used in recipes
    - `environments`// defines the environments that are available to the Chef Server e.g. testing, production...
    - `roles`// used to store the files that are available to thr Chef Server
  

## Librarian-chef/Berkshelf
With Chef your recipes get executed exactly in the order they are specified in your cookbooks. This can lead to missing dependencies which are neccessary for some recipes to work. As it can be very confusing to take care of all dependencies there are tools which take care of that for you.
The currently most popular dependency manager for Chef is [Berkshelf](http://berkshelf.com/) which is also part of the ChefDK

