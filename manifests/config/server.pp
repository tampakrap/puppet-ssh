define ssh::config::server (
  $ensure   = 'present',
  $content  = '',
  $multiple = false,
  $order    = 10,
) {
  include concat::setup
  include ssh::config

  concat::fragment { $name:
    ensure   => $ensure,
    content  => template("${module_name}/config.erb"),
    target   => $ssh::server_config,
    order    => $order
  }
}
