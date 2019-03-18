#
# Cookbook Name::cookbook_totara
# Recipe:: nodejs
#
# Install Nodejs
#

include_recipe "nodejs"

# Install desired npm packages
Array(node["cookbook_totara"]["npm_packages"]).each_with_index do |package_name, index|
  npm_package package_name
end
