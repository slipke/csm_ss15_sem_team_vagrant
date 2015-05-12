name             'lamp-apache'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures a lamp-stack'
long_description 'Installs/Configures a lamp-stack'

version          '0.1.0'

depends "apt"
depends "apache2"
depends 'mysql', '~> 6.0'
depends "php"
depends "lampp"