class ssh::package {

  include ssh
  include ssh::service

  package { $ssh::server_package:
    ensure => $ssh::server_ensure,
    notify => Service['sshd'],
  }

  if $ssh::client_package == 'absent' {
    $client_enabled = false
  } else {
    $client_enabled = true
  }

  if $client_enabled and $ssh::client_package != $ssh::server_package {
    package { $ssh::client_package:
      ensure => $ssh::client_ensure,
    }
  }

}
