# = Define: nodejs::module
#
#
define nodejs::module (
  $ensure = 'present',
  ) {

  if $ensure == 'absent' {
    exec { "nodejs-module-$name":
      command => "npm -g remove $name",
      require => Exec['nodejs-source-build'],
    }
  } else {
    exec { "nodejs-module-$name":
      command => "npm -g install $name",
      require => Exec['nodejs-source-build'],
    }
  }

}
