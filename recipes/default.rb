#
# Cookbook Name::cookbook_totara
# Recipe:: default
#

if node['cookbook_totara']['ssl'] 
	include_recipe "cookbook_totara::ssl"
end

include_recipe "cookbook_totara::database"
include_recipe "cookbook_totara::php"
include_recipe "cookbook_totara::nginx"
include_recipe "cookbook_totara::nodejs"
include_recipe "cookbook_totara::apt"
include_recipe "cookbook_totara::apps"
include_recipe "cookbook_totara::totara"