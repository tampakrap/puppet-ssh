define ssh::server_config (
  $ensure  = 'present',
  $content = '',
) {
  include concat::setup
  include ssh

  concat::fragment { $name:
    ensure  => $ensure,
    content => template('ssh/config.erb'),
    target  => $ssh::server_config,
  }
}
