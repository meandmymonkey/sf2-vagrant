
class package_base
{

  group {
    "puppet": ensure => "present";
  }


  exec
  {
    'init':
      command => 'apt-get update',
      path    => '/usr/bin/'
  }

  package
  {
    'htop':
      ensure  => present,
      require => Exec['init']
  }

}
