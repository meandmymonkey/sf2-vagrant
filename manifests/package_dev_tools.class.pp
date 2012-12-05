
class package_dev_tools
{
  package
  {
    'nfs-kernel-server':
      ensure => present,
  }

  service
  {
    'nfs-kernel-server':
      ensure => running,
      enable => true,
      hasstatus => true,
      require => Package['nfs-kernel-server'],
  }

  package
  {
    'git-core':
      ensure  => present
  }

  package
  {
    'subversion':
      ensure  => present
  }

}
