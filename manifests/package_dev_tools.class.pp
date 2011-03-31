
class package_dev_tools
{

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
