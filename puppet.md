How to generally setup a puppet project?

@@@ WIP @@@

Resources:
http://docs.puppetlabs.com/learning/index.html
Modules: https://github.com/puppetlabs/
Modules: https://github.com/example42/puppet-modules

Install puppet `gem install puppet`

Setup a local project

Create puppet folder
Create puppet/manifest folder
Create puppet/manifest/default.pp
Create puppet/modules folder
`librarian-puppet init` to create a Puppetfile
Add metadata.json

Add a submodule `git submodule add [repository-url] puppet/modules/[module-name]`
`librarian-puppet install`

