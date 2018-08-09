name             'cookbook_totara'
maintainer       'Michael Wright'
maintainer_email 'michael.wright@buildempire.co.uk'
license          'Apache 2.0'
description      'Totara cookbook.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'

recipe 'cookbook_totara', 'Totara Cookbook'

%w{ ubuntu }.each do |os|
  supports os
end

%w{ build-essential php php-fpm nodejs nginx mysql acme }.each do |cb|
  depends cb
end
