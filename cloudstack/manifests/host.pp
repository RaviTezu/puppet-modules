#cloudstack host (for hosting instances)
class cloudstack::host {

    class { 'cloudstack::repo': }

    package {'qemu-kvm':
        ensure => present,
    }

    package {'libvirt':
        ensure => present,
    }
    
    service {'libvirtd':
        ensure  => running,
        enable  => true,
        require => Package['libvirt']
    }
   
    package {'cloudstack-agent':
        ensure => present,
    }
      
    service {'cloudstack-agent':
        ensure  => running,
        enable  => true,
        require => Package['cloudstack-agent']
    }
    
