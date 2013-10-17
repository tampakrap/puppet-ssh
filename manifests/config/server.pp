define ssh::config::server (
  $ensure   = 'present',
  $content  = '',
  $multiple = false,
) {
  include concat::setup
  include ssh::config

  concat::fragment { $name:
    ensure   => $ensure,
    content  => template('ssh/config.erb'),
    target   => $ssh::server_config,
    multiple => $multiple,
  }
}
