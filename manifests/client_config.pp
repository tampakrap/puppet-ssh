define ssh::client_config (
  $ensure  = 'present',
  $content = '',
) {
  include concat::setup
  include ssh

  concat::fragment { $name:
    ensure  => $ensure,
    content => template('ssh/config.erb'),
    target  => $ssh::client_config,
  }
}
