# Class Service
class ntp::service inherits ntp {
  $ntp_service = $ntp::ntp_service
  
    if $facts['kernel'] == 'linux' {
      service {$ntp_service:
        ensure  => running,
        enable  => true,
        require => Package['ntp'],
      }
    }
    if $facts['kernel'] == 'windows' {
      service {$ntp_service:
        ensure  => running,
        enable  => true,
        require => Package['meinberg-ntp'],
      }
    }
}
