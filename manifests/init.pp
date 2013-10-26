class ssh (
  $server_package     = $ssh::params::server_package,
  $server_ensure      = $ssh::params::server_ensure,
  $server_config      = $ssh::params::server_config,
  $client_package     = $ssh::params::client_package,
  $client_ensure      = $ssh::params::client_ensure,
  $client_config      = $ssh::params::client_config,
  $service_name       = $ssh::params::service_name,
  $service_hasstatus  = $ssh::params::service_hasstatus,
  $service_hasrestart = $ssh::params::service_hasrestart,
  $service_enabled    = $ssh::params::service_enabled,
) inherits ssh::params {

  include ssh::package
  include ssh::service

}
