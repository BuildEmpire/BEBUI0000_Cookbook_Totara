#
# Cookbook Name::cookbook_totara
# Recipe:: database
#
# Install database services.
#

root_password = node['cookbook_totara']['database']['root_password']

mysql_service 'default' do
  initial_root_password root_password
  version node['cookbook_totara']['database']['version']
  action %i[create start]
end

mysql_client 'default' do
  action :create
  version node['cookbook_totara']['database']['version']
end

mysql_config 'default' do
  source 'mysql/default.conf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end

if node['cookbook_totara']['database']['databases']
  node['cookbook_totara']['database']['databases'].each do |data|
    execute "Create database '#{data['database_name']}'" do
      cmd = "CREATE DATABASE IF NOT EXISTS #{data['database_name']}"
      command "mysql -e \"#{cmd}\" -h localhost -u root -p#{root_password} --socket /var/run/mysql-default/mysqld.sock"
    end

    if data['username'] && data['password']
      execute "Alter database '#{data['database_name']}' privilege to user '#{data['username']}'" do
        cmd = "GRANT ALL ON #{data['database_name']}.* to '#{data['username']}'@'localhost' identified by '#{data['password']}'"
        command "mysql -e \"#{cmd}\" -h localhost -u root -p#{root_password} --socket /var/run/mysql-default/mysqld.sock"
      end
    end
  end
end