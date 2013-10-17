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
  $service_enabled    = true,
) inherits ssh::params {

  if $client_package == 'absent' {
    $client_enabled = false
  } else {
    $client_enabled = true
  }

  include ssh::package
  include ssh::service
  include concat::setup

  concat { $server_config:
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    notify => Service['sshd'],
  }

  concat::fragment { "${server_config}_header":
    target  => $server_config,
    content => template('ssh/config.erb'),
    order   => 00,
  }

  concat { $client_config:
    owner  => 'root',
    group  => 'root',
  }

  concat::fragment { "${client_config}_header":
    target  => $client_config,
    content => template('ssh/config.erb'),
    order   => 00,
  }

}
