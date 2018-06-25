#
# Cookbook Name::cookbook_totara
# Recipe:: nodejs
#
# Install Nodejs from nodeversions repository.
#

node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '8.11.3' # Latest LTS release on 2018-06-25
node.default['nodejs']['binary']['checksum'] = '1ea408e9a467ed4571730e160993f67a100e8c347f6f9891c9a83350df2bf2be'
include_recipe "nodejs"

# Install desired npm packages
Array(node["cookbook_totara"]["npm_packages"]).each_with_index do |package_name, index|
  npm_package package_name
end
