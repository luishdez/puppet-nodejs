= Puppet module: nodejs

This is a Puppet nodejs module from the second generation of Example42 Puppet Modules.

Made by Luis Hdez / Aggressivex

Official git repository: http://github.com/aggressivex/puppet-nodejs

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module.

For detailed info about the logic and usage patterns of Example42 modules read README.usage on Example42 main modules set.

== USAGE - Basic management

* Install nodejs with default settings

        class { "nodejs": }

* Disable nodejs service.

        class { "nodejs":
          disable => true
        }

* Disable nodejs service at boot time, but don't stop if is running.

        class { "nodejs":
          disableboot => true
        }

* Remove nodejs package

        class { "nodejs":
          absent => true
        }

* Enable auditing without without making changes on existing nodejs configuration files

        class { "nodejs":
          audit_only => true
        }


== USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { "nodejs":
          source => [ "puppet:///modules/lab42/nodejs/nodejs.conf-${hostname}" , "puppet:///modules/lab42/nodejs/nodejs.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { "nodejs":
          source_dir       => "puppet:///modules/lab42/nodejs/conf/",
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file 

        class { "nodejs":
          template => "example42/nodejs/nodejs.conf.erb",      
        }

* Define custom options that can be used in a custom template without the
  need to add parameters to the nodejs class

        class { "nodejs":
          template => "example42/nodejs/nodejs.conf.erb",    
          options  => {
            'LogLevel' => 'INFO',
            'UsePAM'   => 'yes',
          },
        }

* Automaticallly include a custom subclass

        class { "nodejs:"
          my_class => 'nodejs::example42',
        }


== USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)
  Note that this option requires the usage of Example42 puppi module

        class { "nodejs": 
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with
  a puppi::helper define ) to customize the output of puppi commands 

        class { "nodejs":
          puppi        => true,
          puppi_helper => "myhelper", 
        }

* Activate automatic monitoring (recommended, but disabled by default)
  This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { "nodejs":
          monitor      => true,
          monitor_tool => [ "nagios" , "monit" , "munin" ],
        }

* Activate automatic firewalling 
  This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { "nodejs":       
          firewall      => true,
          firewall_tool => "iptables",
          firewall_src  => "10.42.0.0/24",
          firewall_dst  => "$ipaddress_eth0",
        }

