#
# Cookbook Name::cookbook_totara
# Recipe:: apps
#
# Setup nginx/php apps
#

::Chef::Recipe.send(:include, PHPBox::Helpers)

setup_nginx_site(node["cookbook_totara"], node["cookbook_totara"]["root_path"])

# Intsall any custom apt packages we might want
Array(node["cookbook_totara"]["apt_packages"]).each_with_index do |package_name, index|
  package package_name do
    action :install
  end
end