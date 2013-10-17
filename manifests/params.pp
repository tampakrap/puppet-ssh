class ssh::params {
  $server_ensure  = 'present'
  $client_ensure  = 'present'

  case $::osfamily {
    'debian': {},
    'redhat': {},
    'suse': {},
    'gentoo': {
      $server_package = 'net-misc/openssh'
      $server_config  = '/etc/ssh/sshd_config'
      $client_package = 'net-misc/openssh'
      $client_config  = '/etc/ssh/ssh_config'
    },
    default: { fail("$::operatingsystem is not supported") }
  }
}
