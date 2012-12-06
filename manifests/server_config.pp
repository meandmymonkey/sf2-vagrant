
class server_config {
  file { 'apache2.config':
    path    => '/etc/apache2/sites-available/default',
    ensure  => present,
    source  => '/vagrant/resources/app/etc/apache2/sites-available/default',
    require => Package['apache2']
  }

  exec { 'apache2.mods':
    command => 'a2enmod rewrite',
    require => File['apache2.config']
  }

  file { 'php5.config':
    path    => '/etc/php5/apache2/php.ini',
    ensure  => present,
    source  => '/vagrant/resources/app/etc/php5/apache2/php.ini',
    require => Package['apache2']
  }

  file { 'php5-cli.config':
    path    => '/etc/php5/cli/php.ini',
    ensure  => present,
    source  => '/vagrant/resources/app/etc/php5/apache2/php.ini',
    require => Package['php5-cli']
  }

  file { 'mcrypt.config':
    path    => '/etc/php5/conf.d/mcrypt.ini',
    ensure  => present,
    source  => '/vagrant/resources/app/etc/php5/conf.d/mcrypt.ini',
    require => Package['apache2']
  }

  file { 'phpmyadmin.config':
    path    => '/etc/apache2/conf.d/apache.conf',
    ensure  => present,
    source  => '/etc/phpmyadmin/apache.conf',
    require => Package['apache2', 'phpmyadmin']
  }

  exec { 'mysql.password':
    unless  => 'mysqladmin -uroot -proot status',
    command => 'mysqladmin -uroot password root'
  }

  file { 'project.dir':
    path   => '/vagrant/project',
    ensure => directory
  }

  file { 'project.web.dir':
    path    => '/vagrant/project/web',
    ensure  => directory,
    require => File['project.dir']
  }

  file { 'logs.dir':
    path   => '/vagrant/logs',
    ensure => directory
  }

  file { 'logs.apache.dir':
    path    => '/vagrant/logs/apache2',
    ensure  => directory,
    require => File['logs.dir']
  }
}
