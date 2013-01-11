# = Define: nodejs::module
#
#
define nodejs::module (
  $ensure = 'present',
  $provider = $nodejs::module_provider,
  ) {

  package { $name:
    ensure => $ensure,
    provider => $provider,
  }
}
