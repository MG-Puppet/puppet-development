class nftables {
  
  $config       = '/etc/nftables.conf'
  
  $source       = $facts['fqdn'] ? {
    'verkeermeneer.mitchell.test' => 'puppet:///modules/nftables/router.conf',
    'bastionmain.mitchell.test'   => 'puppet:///modules/nftables/bastion.conf',
     default                      => 'puppet:///modules/nftables/nftables.conf',
  }

  package { 'nftables':
    ensure  => 'present',
    before  => File[$config],
  }
   
  file { '/etc/nftables/':
    ensure  => directory,
  }
  
  file { $config:
    ensure  => 'present',
    source  => $source,
    notify  => Service['nftables'],
  }

  service {'nftables':
    ensure  => 'running',
    enable  => 'true',
  }
}
