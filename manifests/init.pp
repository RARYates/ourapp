# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ourapp
class ourapp {

  include apache

  file {'/var/www/html':
    ensure => 'directory',
    owner  => 'apache',
    group  => 'apache'
  }

  file {'/var/www/html/homepage.html':
    content => 'This is my super amazing website',
    owner   => 'apache',
    group   => 'apache'
  }

  apache::vhost {'ourapp':
    port    => 8080,
    docroot => '/var/www/html',
    require => File['/var/www/html'],
  }
}
