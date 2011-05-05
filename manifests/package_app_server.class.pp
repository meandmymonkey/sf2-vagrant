
class package_app_server
{

  package
  {
    'sendmail':
      ensure  => present
  }

  package
  {
    'mysql-server':
      ensure  => present
  }

  package
  {
    'mysql-client':
      ensure  => present
  }

  package
  {
    'apache2':
      ensure  => present,
      require => Package['mysql-server']
  }

  package
  {
    'php5':
      ensure  => present,
      require => Package['apache2']
  }

  package
  {
    'php5-intl':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php-apc':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-xdebug':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-curl':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-sqlite':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'phpmyadmin':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-cli':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php-pear':
      ensure  => present,
      require => Package['php5-cli']
  }

  file
  {
    'pear.tmpdirfix.prepare':
      ensure  => directory,
      path    => '/tmp/pear',
      require => Package['php5-cli']
  }

  file
  {
    'pear.tmpdirfix':
      ensure  => directory,
      path    => '/tmp/pear/cache',
      mode    => 777,
      require => File['pear.tmpdirfix.prepare']
  }

  exec
  {
    'pear.upgrade':
      path => '/bin:/usr/bin:/usr/sbin',
      command => 'pear upgrade PEAR',
      require => File['pear.tmpdirfix']
  }

  exec
  {
    'phpunit.prepare1':
      unless => 'pear channel-info pear.phpunit.de',
      path => '/bin:/usr/bin:/usr/sbin',
      command => 'pear channel-discover pear.phpunit.de',
      require => Exec['pear.upgrade']
  }

  exec
  {
    'phpunit.prepare2':
      unless => 'pear channel-info pear.symfony-project.com',
      path => '/bin:/usr/bin:/usr/sbin',
      command => 'pear channel-discover pear.symfony-project.com',
      require => Exec['phpunit.prepare1']
  }

  exec
  {
    'phpunit.prepare3':
      unless => 'pear channel-info components.ez.no',
      path => '/bin:/usr/bin:/usr/sbin',
      command => 'pear channel-discover components.ez.no',
      require => Exec['phpunit.prepare2']
  }

  exec
  {
    'phpunit.install':
      unless => 'pear info phpunit/PHPUnit',
      path => '/bin:/usr/bin:/usr/sbin',
      command => 'pear install phpunit/PHPUnit --alldeps',
      require => Exec['phpunit.prepare3']
  }

}
