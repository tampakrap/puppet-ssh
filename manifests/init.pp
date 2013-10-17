class ssh (
  $server_package = $ssh::params::server_package,
  $server_ensure  = $ssh::params::server_ensure,
  $server_config  = $ssh::params::server_config,
  $client_package = $ssh::params::client_package,
  $client_ensure  = $ssh::params::client_ensure,
  $client_config  = $ssh::params::client_config,
) inherits ssh::params {

  if $client_package == 'absent' {
    $client_enabled = false
  } else {
    $client_enabled = true
  }

  include ssh::package

}
