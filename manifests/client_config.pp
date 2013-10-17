define ssh::client_config (
  $ensure  = 'present',
  $content = '',
) {
  include concat::setup
  include ssh::config

  concat::fragment { $name:
    ensure  => $ensure,
    content => template('ssh/config_header.erb'),
    target  => $ssh::client_config,
  }
}
