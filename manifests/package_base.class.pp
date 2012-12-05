
class package_base
{

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

  package
  {
    'puppet':
      ensure  => present
  }

}
