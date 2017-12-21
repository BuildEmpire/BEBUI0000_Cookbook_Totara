#
# Cookbook Name:: cookbook_totara
# Recipe::totara
#

# Create the cronic directory
# Cronic is a cron job report wrapper
directory File.dirname(node['cookbook_totara']['cronic']) do
  action :create
  recursive true
end

# Create the cronic file
template node['cookbook_totara']['cronic'] do
  source 'cronic.erb'
  mode '755'
end

# Deduce the site and data directories
site_dir = "/home/apps/#{node['cookbook_totara']['appname']}/current/public"
data_dir = "/home/apps/#{node['cookbook_totara']['appname']}/shared/data"

# Create a cron job
cron 'Totara Maintenance Cron' do
  hour node['cookbook_totara']['cron_hour']
  minute node['cookbook_totara']['cron_minute']
  command "#{node['cookbook_totara']['cronic']} php #{site_dir}/admin/cli/cron.php"
end

# Only create the directories and ocnfig file if we're localhost.
if node['cookbook_totara']['hostname'] == 'totara.lvh.me'

  # Create the site and data directories with the right permissions
  [site_dir, data_dir].each do |dir|
    directory dir do
      action :create
      recursive true
      group node['cookbook_totara']['group']
    end
  end

  # Change the owner of the data directory
  execute "Change owner of #{data_dir}" do
    command "chown -R #{node['cookbook_totara']['user']}:#{node['cookbook_totara']['group']} #{data_dir}"
  end

end