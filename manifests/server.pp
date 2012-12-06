
class server {
  package { 'sendmail':
    ensure  => present
  }

  package { 'mysql-server':
    ensure  => present
  }

  package { 'mysql-client':
    ensure  => present
  }

  package { 'apache2':
    ensure  => present,
  }

  service { 'apache2':
    ensure => running,
    enable => true,
    subscribe => File['apache2.config']
  }

  package { 'php5':
    ensure  => present,
    require => Package['apache2']
  }

  package { 'php5-intl':
    ensure  => present,
    require => Package['php5']
  }

  package { 'php-apc':
    ensure  => present,
    require => Package['php5']
  }

  package { 'php5-xdebug':
    ensure  => present,
    require => Package['php5']
  }

  package { 'php5-curl':
    ensure  => present,
    require => Package['php5']
  }

  package { 'php5-sqlite':
    ensure  => present,
    require => Package['php5']
  }

  package { 'phpmyadmin':
    ensure  => present,
    require => Package['php5']
  }

  package { 'php5-cli':
    ensure  => present,
    require => Package['php5']
  }

  package { 'php-pear':
    ensure  => present,
    require => Package['php5-cli']
  }

  file { 'pear.tmpdirfix.prepare':
    ensure  => directory,
    path    => '/tmp/pear',
    require => Package['php-pear']
  }

  file { 'pear.tmpdirfix':
    ensure  => directory,
    path    => '/tmp/pear/cache',
    mode    => 777,
    require => File['pear.tmpdirfix.prepare']
  }

  exec { 'pear.upgrade.pear':
    command => 'pear channel-update pear.php.net',
    require => File['pear.tmpdirfix']
  }

  package { 'htop':
    ensure  => present,
  }

  package { 'puppet':
    ensure => present
  }
}
