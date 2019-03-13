default['cookbook_totara']['user'] = 'vagrant'
default['cookbook_totara']['group'] = 'vagrant'
default['cookbook_totara']['appname'] = 'totara'
default['cookbook_totara']['hostname'] = 'totara.lvh.me'
default['cookbook_totara']['root_path'] = '/home/apps/totara/current'
default['cookbook_totara']['cronic'] = '/opt/bin/cronic'
default['cookbook_totara']['cron_hour'] = "*"
default['cookbook_totara']['cron_minute'] = "*"

default['nodejs']['version'] = '8.11.3'
default['nodejs']['install_method'] = 'binary'
default['nodejs']['binary']['checksum'] = '1ea408e9a467ed4571730e160993f67a100e8c347f6f9891c9a83350df2bf2be'

default['cookbook_totara']['htpasswd'] = {
  'username' => '',
  'password' => '',
  'path'     => ''
}

default['nginx']['version']           = '1.14.2'
default['nginx']['listen_port']       = '80'
default['nginx']['listen_ssl_port']   = '443'
default['nginx']['variables']         = {}
default['nginx']['shared_path']       = '/home/apps/totara/shared'

default['php']['version']           = '7.2'
default['php']['install_method']    = 'package'
default['php']['pear']              = 'pear'
default['php']['curl']              = {'package' => 'php7.2-curl'}
default['php']['gd']                = {'package' => 'php7.2-gd'}
default['php']['packages']          = %w(php7.2-cgi php7.2 php7.2-dev php7.2-cli php7.2-mysql php7.2-gd php7.2-mbstring php7.2-zip php7.2-curl php7.2-intl php7.2-xmlrpc php7.2-soap php7.2-xml)


default['php-fpm']['pools'] = {
  "www" => {
    :listen      => '127.0.0.1:9001',
    :php_options => {
      'php_admin_value[sendmail_path]'       => '/usr/sbin/ssmtp -t',
      'php_admin_value[date.timezone]'       => 'Europe/London',
      'php_admin_flag[short_open_tag]'       => 'off',
      'php_admin_flag[magic_quotes_gpc]'     => 'off',
      'php_admin_flag[register_globals]'     => 'off',
      'php_admin_flag[session.autostart]'    => 'off',
      'php_admin_value[upload_max_filesize]' => '512M',
      'php_admin_value[post_max_size]'       => '512M',
      'php_admin_value[max_execution_time]'  => 600,
      'php_admin_value[opcache.enable]'      => 1,
      'php_admin_value[max_input_vars]'      => 2000
    }
  }
}

default['cookbook_totara']['apt_packages'] = []
default['cookbook_totara']['npm_packages'] = []
default['cookbook_totara']['php_packages'] = []
default['cookbook_totara']['php_pears'] = []

default['cookbook_totara']['database']['root_password'] = nil
default['cookbook_totara']['database']['version'] = '5.7'
default['cookbook_totara']['database']['databases'] = []

default['cookbook_totara']['ssl'] = false;
