class apache {

  package {'apache2':
    ensure  => 'present',
  }

  nftables::rule {'http_port':
    rule => 'tcp dport 80 accept;',
  }

}
