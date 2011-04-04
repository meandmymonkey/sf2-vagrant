
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
    'phpunit':
      ensure  => present,
      require => Package['php5-cli']
  }

}
