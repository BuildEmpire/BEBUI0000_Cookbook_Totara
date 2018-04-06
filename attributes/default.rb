default['build-essential']['compile_time'] = true

default['cookbook_totara']['user'] = 'vagrant'
default['cookbook_totara']['group'] = 'vagrant'
default['cookbook_totara']['appname'] = 'totara'
default['cookbook_totara']['hostname'] = 'totara.lvh.me'
default['cookbook_totara']['root_path'] = '/home/apps/totara/current'

default['cookbook_totara']['cronic'] = '/opt/bin/cronic'
default['cookbook_totara']['cron_hour'] = "*"
default['cookbook_totara']['cron_minute'] = "*/5"

default['cookbook_totara']['htpasswd'] = {
  'username' => '',
  'password' => '',
  'path' => ''
}

default['cookbook_totara']['default_config']['nginx'] = {
  'template_name' => 'nginx_vhost_totara.conf.erb',
  'template_cookbook' => 'cookbook_totara',
  'listen_port' => '80',
  'variables' => {}
}

default['cookbook_totara']['default_config']['php'] = {
  'version' => '7.2',
  'conf_dir' => '/etc/php/7.2/cli',
  'curl' => {'package' => 'php7.2-curl'},
  'gd' => {'package' => 'php7.2-gd'},
  'fpm_package' => 'php7.2-fpm',
  'fpm_pooldir' => '/etc/php/7.2/fpm/pool.d',
  'fpm_service' => 'php7.2-fpm',
  'fpm_socket' => '/var/run/php/php7.2-fpm.sock',
  'fpm_default_conf' => '/etc/php/7.2/fpm/pool.d/www.conf',
  'ext_conf_dir' => '/etc/php/7.2/mods-available',
  'packages' => %w(php7.2-cgi php7.2 php7.2-dev php7.2-cli php7.2-mysql php7.2-gd php7.2-mbstring php7.2-zip php7.2-curl php7.2-intl php7.2-xmlrpc php7.2-soap)
}

default['cookbook_totara']['default_config']['php-fpm']['pools'] = {
  "www" => {
    :listen => '127.0.0.1:9001',
    :php_options => {
      'php_admin_value[sendmail_path]' => '/usr/sbin/ssmtp -t',
      'php_admin_value[date.timezone]' => 'Europe/London',
      'php_admin_flag[short_open_tag]' => 'off',
      'php_admin_flag[magic_quotes_gpc]' => 'off',
      'php_admin_flag[register_globals]' => 'off',
      'php_admin_flag[session.autostart]' => 'off',
      'php_admin_value[upload_max_filesize]' => '512M',
      'php_admin_value[post_max_size]' => '512M',
      'php_admin_value[max_execution_time]' => 600,
      'php_admin_value[opcache.enable]' => 1,
      'php_admin_value[max_input_vars]' => 2000
    }
  }
}

default['cookbook_totara']['default_config']['php-fpm']['version'] = '7.2'
default['cookbook_totara']['default_config']['php-fpm']['conf_dir'] = '/etc/php/7.2/fpm/conf.d'
default['cookbook_totara']['default_config']['php-fpm']['pool_conf_dir'] = '/etc/php/7.2/fpm/pool.d'
default['cookbook_totara']['default_config']['php-fpm']['conf_file'] = '/etc/php/7.2/fpm/php-fpm.conf'
default['cookbook_totara']['default_config']['php-fpm']['error_log'] = '/var/log/php7.2-fpm.log'
default['cookbook_totara']['default_config']['php-fpm']['pid'] = '/var/run/php7.2-fpm.pid'

default['cookbook_totara']['mysql'] = {
  'version' => '5.7',
  'configuration_template' => 'default.cnf.erb'
}
