class ssh::package {
  include ssh
  include ssh::params

  package { $ssh::server_package:
    ensure => $ssh::server_ensure,
  }

  if $ssh::client_enabled and $ssh::client_package != $ssh::server_package {
    package { $ssh::client_package:
      ensure => $ssh::client_ensure,
    }
  }

}
