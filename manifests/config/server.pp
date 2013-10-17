define ssh::config::server (
  $ensure   = 'present',
  $content  = '',
  $multiple = false,
) {
  include concat::setup
  include ssh::config

  if $name == 'Ports' { $order = '01' }

  concat::fragment { $name:
    ensure   => $ensure,
    content  => template('ssh/config.erb'),
    target   => $ssh::server_config,
    order    => $order
  }
}
