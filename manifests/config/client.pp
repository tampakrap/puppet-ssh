define ssh::config::client (
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
    target   => $ssh::client_config,
    multiple => $multiple,
    order    => $order,
  }
}
