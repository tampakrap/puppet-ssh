class ssh::service (
  $service_name       = $ssh::service_name,
  $enabled            = $ssh::service_enabled,
  $service_hasstatus  = $ssh::service_hasstatus,
  $service_hasrestart = $ssh::service_hasrestart,
) {

  service { 'sshd':
    name       => $service_name,
    ensure     => $enabled ? {true => running, false => stopped },
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
    enable     => $enabled,
  }
}
