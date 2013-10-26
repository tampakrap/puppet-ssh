class ssh::service {

  include ssh

  service { 'sshd':
    name       => $ssh::service_name,
    ensure     => $ssh::service_enabled ? {true => running, false => stopped },
    hasstatus  => $ssh::service_hasstatus,
    hasrestart => $ssh::service_hasrestart,
    enable     => $ssh::enabled,
  }
}
