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

  concat {'/var/www/html/index.html':
    ensure => present,
    owner   => 'apache',
    group   => 'apache'
  }

  concat::fragment {'ourapp-index-header':
    target => '/var/www/html/index.html',
    source => 'puppet:///modules/ourapp/index-header.html',
    order  => '01',
  }

  concat::fragment {'ourapp-index-footer':
    target => '/var/www/html/index.html',
    source => 'puppet:///modules/ourapp/index-footer.html',
    order  => '03',
  }

  apache::vhost {'ourapp':
    port    => 8080,
    docroot => '/var/www/html',
    require => File['/var/www/html'],
  }
}
