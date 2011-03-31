
class config_varnish
{

  file 
  {
    'varnish.config':
      path    => '/etc/varnish/default.vcl',
      ensure  => present,
      source  => '/vagrant/resources/varnish/etc/varnish/default.vcl',
      require => Package['varnish']
  }

}
