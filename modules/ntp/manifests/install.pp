# Install class to manage NTP installs

class ntp::install {
  
  case $facts['kernel'] {
    'Linux': {
       package {'ntp':
        ensure => 'present',
       }
    }
    'Windows': {
      package {'meinberg-ntp':
        ensure   => latest,
        provider => 'chocolatey',
      }      
     }
    
    'default': {
      fail("Sorry, ${::kernel} is not supported by this module")
    }
  }
  
}
