class ssh::config (
  $server_config = $ssh::server_config,
  $client_config = $ssh::client_config,
) {

  include ssh
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
