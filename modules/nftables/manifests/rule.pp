
  define nftables::rule(
    String $rule,
  ) {
    require ::nftables

    file { "/etc/nftables/${name}_puppet.nft":
      ensure  => 'present',
      content => $rule,
    }   
}
