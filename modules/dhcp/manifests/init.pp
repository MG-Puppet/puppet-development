class dhcp {

  $package     = 'isc-dhcp-server'
  $config_file_service = '/etc/default/isc-dhcp-server'
  $config_file_pools = '/etc/dhcp/dhcpd.conf'

  package { $package:
    ensure => 'present',
  }

  file { $config_file_service:
    ensure => 'present',
    source => 'puppet:///modules/dhcp/isc-dhcp-server',
    notify => Service['isc-dhcp-server'],
  }

  file { $config_file_pools:
    ensure => present,
    source => 'puppet:///modules/dhcp/dhcpd.conf',
    notify => Service['isc-dhcp-server'],
  }

  service {'isc-dhcp-server':
    ensure => 'running',
    enable => 'true',
  }

}
