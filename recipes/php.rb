#
# Cookbook Name::cookbook_totara
# Recipe:: php
#
# Install php
#

node.override['php']['install_method'] = node['cookbook_totara']['default_config']['php']['install_method']
node.override['php']['version'] = node['cookbook_totara']['default_config']['php']['version']
node.override['php']['packages'] = node['cookbook_totara']['default_config']['php']['packages']
node.override['php']['pear'] = node['cookbook_totara']['default_config']['php']['pear']
node.override['php']['conf_dir'] = node['cookbook_totara']['default_config']['php']['conf_dir']
node.override['php']['curl'] = node['cookbook_totara']['default_config']['php']['curl']
node.override['php']['gd'] = node['cookbook_totara']['default_config']['php']['gd']
node.override['php']['fpm_package'] = node['cookbook_totara']['default_config']['php']['fpm_package']
node.override['php']['fpm_pooldir'] = node['cookbook_totara']['default_config']['php']['fpm_pooldir']
node.override['php']['fpm_service'] = node['cookbook_totara']['default_config']['php']['fpm_service']
node.override['php']['fpm_socket'] = node['cookbook_totara']['default_config']['php']['fpm_socket']
node.override['php']['fpm_default_conf'] = node['cookbook_totara']['default_config']['php']['fpm_default_conf']
node.override['php']['ext_conf_dir'] = node['cookbook_totara']['default_config']['php']['ext_conf_dir']

node.override['php-fpm']['pools'] = node['cookbook_totara']['default_config']['php-fpm']['pools']
node.override['php-fpm']['conf_dir'] = node['cookbook_totara']['default_config']['php-fpm']['conf_dir']
node.override['php-fpm']['pool_conf_dir'] = node['cookbook_totara']['default_config']['php-fpm']['pool_conf_dir']
node.override['php-fpm']['conf_file'] = node['cookbook_totara']['default_config']['php-fpm']['conf_file']
node.override['php-fpm']['error_log'] = node['cookbook_totara']['default_config']['php-fpm']['error_log']
node.override['php-fpm']['pid'] = node['cookbook_totara']['default_config']['php-fpm']['pid']
node.override['php-fpm']['package_name'] = node['cookbook_totara']['default_config']['php-fpm']['package_name']

apt_repository 'ondrej-php' do
    uri     'ppa:ondrej/php'
    trusted true
end

include_recipe "php"
include_recipe "php-fpm"

Array(node["cookbook_totara"]["php_packages"]).each_with_index do |package_name, index|
  package package_name do
    action :install
  end
end

Array(node["cookbook_totara"]["php_pears"]).each_with_index do |pear_name, index|
  php_pear pear_name do
    action :install
  end
end

service "php-fpm" do
  action :restart
end
