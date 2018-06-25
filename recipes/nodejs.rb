#
# Cookbook Name::cookbook_totara
# Recipe:: nodejs
#
# Install Nodejs from nodeversions repository.
#

# this invokes `include_recipe "nodejs"` as a dependency
include_recipe "nodejs::npm"
