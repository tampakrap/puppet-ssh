class ssh::package (
  $server_package = $ssh::server_package,
  $server_ensure  = $ssh::server_ensure,
  $client_package = $ssh::client_package,
  $client_ensure  = $ssh::client_ensure,
) {

  package { $server_package:
    ensure => $server_ensure,
  }

  if $client_package == 'absent' {
    $client_enabled = false
  } else {
    $client_enabled = true
  }

  if $client_enabled and $client_package != $server_package {
    package { $client_package:
      ensure => $client_ensure,
    }
  }

}
