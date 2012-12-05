
class package_base
{

  exec
  {
    'init':
      command => 'apt-get update',
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
      ensure => present
  }

  package
  {
    'curl':
      ensure => present
  }

}
