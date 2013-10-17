define ssh::server_config (
  $ensure  = 'present',
  $content = '',
) {
  include concat::setup
  include ssh::config

  concat::fragment { $name:
    ensure  => $ensure,
    content => template('ssh/config_header.erb'),
    target  => $ssh::server_config,
  }
}
