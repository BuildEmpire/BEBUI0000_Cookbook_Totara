#
# Cookbook Name::cookbook_totara
# Recipe:: apps
#
# Setup nginx/php apps
#

::Chef::Recipe.send(:include, PHPBox::Helpers)

setup_nginx_site(node["cookbook_totara"], node["cookbook_totara"]["root_path"])