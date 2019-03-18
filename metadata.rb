name             'cookbook_totara'
maintainer       'Michael Wright'
maintainer_email 'michael.wright@buildempire.co.uk'
license          'Apache 2.0'
description      'Totara cookbook.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

recipe 'cookbook_totara', 'Totara Cookbook'

supports 'ubuntu'
depends 'apt'
depends 'locale', '~> 2.1'
depends 'git', '~> 9'

depends 'mysql'
depends 'php'
depends 'php-fpm'
depends 'nodejs'
depends 'nginx'
depends 'acme'