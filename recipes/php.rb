#
# Cookbook Name::cookbook_totara
# Recipe:: php
#
# Install php
#

include_recipe "php"
include_recipe "php-fpm"

Array(node["cookbook_totara"]["php_pears"]).each_with_index do |pear_name, index|
  php_pear pear_name do
    action :install
  end
end
