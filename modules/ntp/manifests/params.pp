
class ntp::params {

  $servers = [ 
    'be.pool.ntp.org',
    '192.168.153.100',
    '192.168.153.101',
  ]

  if($::kernel == 'linux'){
    $config_file = '/etc/ntp.conf'
  }
  if($::kernel == 'windows'){
    $config_file ='c:\\ntp\\etc\\ntp.conf'
  }

  case $facts['os']['name'] {
    'RedHat', 'CentOS': {
      $ntp_service = 'ntpd'
    }
    default: {
      $ntp_service = 'ntp'
    }
  }

}
