class ssh::config {

  include ssh
  include ssh::service
  include concat::setup

  concat { $ssh::server_config:
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    notify => Service['sshd'],
  }

  concat::fragment { "${ssh::server_config}_header":
    target  => $ssh::server_config,
    content => template("${module_name}/config_header.erb"),
    order   => 00,
  }

  concat { $ssh::client_config:
    owner  => 'root',
    group  => 'root',
  }

  concat::fragment { "${ssh::client_config}_header":
    target  => $ssh::client_config,
    content => template("${module_name}/config_header.erb"),
    order   => 00,
  }

}
