#cloudstack host (for hosting instances)
class cloudstack::host {

    class { 'cloudstack::repo': }

    package {'qemu-kvm':
        ensure => present,
    }

    file{'/etc/libvirt/qemu.conf':
        ensure  => present,
        content => template('cloudstack/host/qemu_conf.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['qemu-kvm']
    }

    package {'libvirt':
        ensure => present,
    }

    service {'libvirtd':
        ensure  => running,
        enable  => true,
        require => Package['libvirt']
    }

    file {'/etc/libvirt/libvirtd.conf':
        ensure  => present,
        content => template('cloudstack/host/libvirtd_conf.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['libvirt'],
        notify  => Service['libvirtd'],
    }

    file {'/etc/sysconfig/libvirtd':
        ensure  => present,
        content => template('cloudstack/host/sys_libvirtd.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['libvirt'],
        notify  => Service['libvirtd'],
    }

    package {'cloudstack-agent':
        ensure => present,
    }

    service {'cloudstack-agent':
        ensure  => running,
        enable  => true,
        require => Package['cloudstack-agent']
    }
}
