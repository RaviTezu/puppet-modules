#cloudstack management node(for managing cloudstack environment)
class cloudstack::management {

    class{"cloudstack::repo": }
    
    Package {'mysql-server':
        ensure => present
    }   
  
    file {'/etc/my.cnf':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template(''),
        require => Package['mysql-server'],
        notify  => Service['mysqld']
    }
    
    Service {'mysqld':
        ensure => running,
        enable => true
    } 
   
    Package {'cloudstack-mangagement':
        ensure => present
    }
}
