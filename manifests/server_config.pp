
class server_config {
  file { 'apache2.config':
    path   => '/etc/apache2/sites-available/default',
    ensure => present,
    source => '/vagrant/resources/app/etc/apache2/sites-available/default'
  }

  exec { 'apache2.mods':
    command => 'a2enmod rewrite',
    require => File['apache2.config']
  }

  file { 'php5.config':
    path   => '/etc/php5/apache2/php.ini',
    ensure => present,
    source => '/vagrant/resources/app/etc/php5/apache2/php.ini'
  }

  file { 'php5-cli.config':
    path   => '/etc/php5/cli/php.ini',
    ensure => present,
    source => '/vagrant/resources/app/etc/php5/apache2/php.ini'
  }

  file { 'mcrypt.fix':
    path   => '/etc/php5/conf.d/mcrypt.ini',
    ensure => present,
    source => '/vagrant/resources/app/etc/php5/conf.d/mcrypt.ini'
  }

  file { 'phpmyadmin.config':
    path   => '/etc/apache2/conf.d/apache.conf',
    ensure => present,
    source => '/etc/phpmyadmin/apache.conf'
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

  file { 'system.logs.dir':
    path   => '/vagrant/logs',
    ensure => directory
  }

  file { 'apache.logs.dir':
    path    => '/vagrant/logs/apache2',
    ensure  => directory,
    require => File['system.logs.dir']
  }
}
