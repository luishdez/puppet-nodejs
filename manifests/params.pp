# Class: nodejs::params
#
# This class defines default parameters used by the main module class nodejs
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to nodejs class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class nodejs::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'nodejs',
    default                   => 'nodejs',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'nodejs',
    default                   => 'nodejs',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'nodejs',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'nodejs',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/nodejs',
  }

  $config_file = $::operatingsystem ? {
    /(?i:RedHat|Scientific|Centos|Fedora)/ => '/etc/nodejs.config',
    default                                => '/etc/nodejs/nodejs.config',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    default                   => '',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/run/nodejs.pid',
    default                   => '/var/run/nodejs/nodejs.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/nodejs',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/nodejs',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/nodejs/nodejs.log',
    default                   => '/var/log/nodejs/nodejs.log',
  }


  $version = 'v0.8.17'
  $relversion = '1'

  $package_provider = 'make'
  $package_source_path = '/root/sources'
  $package_source_file = "${version}.tar.gz"
  $package_source = "http://nodejs.org/dist/${version}/node-${package_source_file}"

  $module_provider = 'npm'

  $port = '8080'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
