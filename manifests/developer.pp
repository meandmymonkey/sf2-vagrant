
class developer {
  package { 'nfs-kernel-server':
    ensure => present,
  }

  service { 'nfs-kernel-server':
    ensure => running,
    enable => true,
    hasstatus => true,
    require => Package['nfs-kernel-server'],
  }

  package { 'git-core':
    ensure  => present
  }

  package { 'subversion':
    ensure  => present
  }

  package { 'curl':
    ensure => present
  }

  exec { 'composer.phar.local':
    command => 'curl -s http://getcomposer.org/installer | php',
    require => Package['curl', 'php5']
  }

  exec { 'composer.phar.global':
    command => 'mv ./composer.phar /usr/bin/composer.phar',
    require => Exec['composer.phar.local']
  }
}
