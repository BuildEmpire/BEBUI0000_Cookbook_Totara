#
# Cookbook Name::cookbook_totara
# Recipe:: default
#

include_recipe "cookbook_totara::database"
include_recipe "cookbook_totara::php"
include_recipe "cookbook_totara::nginx"
include_recipe "cookbook_totara::apps"
include_recipe "cookbook_totara::totara"