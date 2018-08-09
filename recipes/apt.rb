#
# Cookbook Name::cookbook_totara
# Recipe:: apt
#
# Install any custom APT packages
#

Array(node["cookbook_totara"]["apt_packages"]).each_with_index do |package_name, index|
  package package_name do
    action :install
  end
end