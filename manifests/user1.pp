# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ourapp::user0
class ourapp::user1 {
  include 'ourapp'

  file {'/var/www/html/user1.html':
    content => 'This is my even better webpage',
    owner   => 'apache',
    group   => 'apache',
    require => Class['apache']
  }

  ourapp::index {'user1':}

}
