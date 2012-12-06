
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

# run apt-get update before any package install
Exec['apt-get update'] -> Class['server']
Exec['apt-get update'] -> Class['developer']

class {'server':}
class {'server_config':}
class {'developer':}
