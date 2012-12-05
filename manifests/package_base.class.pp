
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
