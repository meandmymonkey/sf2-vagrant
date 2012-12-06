
import 'server.pp'
import 'server_config.pp'
import 'developer.pp'

# set global path
Exec {
  path => ['/usr/bin', '/bin', '/usr/sbin', '/sbin']
}

exec { 'apt-get update':
  command => 'apt-get update',
}

Exec['apt-get update'] -> Class['server']
Class['server_config'] -> Class['server']
Exec['apt-get update'] -> Class['developer']

class {'server':}
class {'server_config':}
class {'developer':}
