#
# Cookbook Name::cookbook_totara
# Recipe:: default
#

include_recipe 'apt'

locale 'set locale' do
  lang 'en_US.utf'
  lc_all 'en_US.utf8'
end

include_recipe 'git'


if node['cookbook_totara']['ssl'] 
	include_recipe "cookbook_totara::ssl"
end

include_recipe "cookbook_totara::database"
include_recipe "cookbook_totara::php"
include_recipe "cookbook_totara::nginx"
include_recipe "cookbook_totara::apt"
include_recipe "cookbook_totara::totara"