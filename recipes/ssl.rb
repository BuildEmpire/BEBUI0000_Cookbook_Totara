#
# Cookbook Name::cookbook_totara
# Recipe:: ssl
#
# Self Signed SSL Certificate
#

include_recipe 'acme'

acme_selfsigned "#{node['cookbook_totara']['appname']}" do
  crt     "/etc/ssl/#{node['cookbook_totara']['appname']}.crt"
  key     "/etc/ssl/#{node['cookbook_totara']['appname']}.key"
end