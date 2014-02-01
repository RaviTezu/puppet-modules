#For logstash agent

class logstash::agent {

  package {'logstash':
    ensure => latest,
  }

  file {'/etc/logstash/logstash.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logstash/logstash_conf.erb'),
    require => Package['logstash'],
  }

  file {'/etc/logstash/logstash':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('logstash/logstash_server_conf.erb'),
    require => Package['logstash'],
  }

  service {'logstash':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/logstash/logstash.conf'],
  }
}
