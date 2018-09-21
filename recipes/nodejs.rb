#
# Cookbook Name::cookbook_totara
# Recipe:: nodejs
#
# Install Nodejs
#

node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = node['cookbook_totara']['nodejs']['version']
node.default['nodejs']['binary']['checksum'] = node['cookbook_totara']['nodejs']['checksum']
include_recipe "nodejs"

# Install desired npm packages
Array(node["cookbook_totara"]["npm_packages"]).each_with_index do |package_name, index|
  npm_package package_name
end
