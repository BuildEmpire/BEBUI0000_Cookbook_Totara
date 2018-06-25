#
# Cookbook Name::cookbook_totara
# Recipe:: nodejs
#
# Install Nodejs from nodeversions repository.
#

node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '8.11.3'
node.default['nodejs']['binary']['checksum'] = '1ea408e9a467ed4571730e160993f67a100e8c347f6f9891c9a83350df2bf2be'
include_recipe "nodejs"
