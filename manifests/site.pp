node 'verkeermeneer.mitchell.test' {
 # include nftables
}

node 'w10-clean' {
  include chocolatey
  include ntp
}

node 'wiezeddegij.mitchell.test' {
  include nftables
  include dhcp
  include ntp   
}

node 'bastionmain.mitchell.test' {
  include nftables
}

node 'webmeneer.mitchell.test' {
  include nftables
  include apache
}
