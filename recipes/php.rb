#
# Cookbook Name::cookbook_totara
# Recipe:: php
#
# Install php
#

node.set['php']['version'] = node['cookbook_totara']['default_config']['php']['version']
node.set['php-fpm']['pools'] = node['cookbook_totara']['default_config']['php-fpm']['pools']
node.set['php']['packages'] = node['cookbook_totara']['default_config']['php']['packages']

node.set['php']['conf_dir'] = node['cookbook_totara']['default_config']['php']['conf_dir']
node.set['php']['curl'] = node['cookbook_totara']['default_config']['php']['curl']
node.set['php']['gd'] = node['cookbook_totara']['default_config']['php']['gd']
node.set['php']['fpm_package'] = node['cookbook_totara']['default_config']['php']['fpm_package']
node.set['php']['fpm_pooldir'] = node['cookbook_totara']['default_config']['php']['fpm_pooldir']
node.set['php']['fpm_service'] = node['cookbook_totara']['default_config']['php']['fpm_service']
node.set['php']['fpm_socket'] = node['cookbook_totara']['default_config']['php']['fpm_socket']
node.set['php']['fpm_default_conf'] = node['cookbook_totara']['default_config']['php']['fpm_default_conf']
node.set['php']['ext_conf_dir'] = node['cookbook_totara']['default_config']['php']['ext_conf_dir']

node.set['php-fpm']['conf_dir'] = node['cookbook_totara']['default_config']['php-fpm']['conf_dir']
node.set['php-fpm']['pool_conf_dir'] = node['cookbook_totara']['default_config']['php-fpm']['pool_conf_dir']
node.set['php-fpm']['conf_file'] = node['cookbook_totara']['default_config']['php-fpm']['conf_file']
node.set['php-fpm']['error_log'] = node['cookbook_totara']['default_config']['php-fpm']['error_log']
node.set['php-fpm']['pid'] = node['cookbook_totara']['default_config']['php-fpm']['pid']

apt_repository 'ondrej-php' do
  uri          'ppa:ondrej/php'
  trusted      true
end

include_recipe "php"
include_recipe "php-fpm"
