# Totara Cookbook

Cookbook for setting up PHP 7 + MySQL environment for Totara Learn.

## Attributes

There is a file for the default config options within the cookbooks, eg. version numbers, additional packages to install, config options etc. They are normally overwritten in the Node Config JSON that is used within Chef.

## Templates

Templates that are used to generate the correct files at the point of provisioning, these include Nginx & MySQL config.

## Recipes

### `apt.rb`
- Install additional defined packages 

### `database.rb`
- Set up MySQL 
- Start MySQL service
- Create database
- Add MySQL users

### `default.rb`
- Set up git
- Set up apt
- Run additional required Totara recipes

### `nginx.rb`
- Install nginx

### `nodejs.rb`
- Install Node JS
- Install NPM Packages

### `php.rb`
- Install php
- Install php-fpm
- Install additional pear packages

### `ssl.rb`
- Set up a self-signed SSL Certificate (mostly used locally where SSL is required)

### `totara.rb`
- Set up Nginx Site Config
- Create www-data user
- Create deployment user
- Set up Cron job for Totara
- If locally, set up site/data directories.

## Example Chef Node Config:

```
{
  "ipaddress": "[IP ADDRESS]",
  "name": "[SITE HOSTNAME]",
  "run_list": [
    "composer",
    "cookbook_totara"
  ],
  "cookbook_totara": {
    "user": "deploy",
    "group": "deploy",
    "hostname": "[HOSTNAME]",
    "ssh_keys": [
      "[SSH KEYS]"
    ]
  }
}

```
