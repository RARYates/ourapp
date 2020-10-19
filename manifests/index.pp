# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   ourapp::index { 'namevar': }
define ourapp::index (
  $index = $name,
) {
  concat::fragment { "ourapp-${index}-index":
    target  => '/var/www/html/index.html',
    content => "<li><a href='./${index}.html'>${index}</a></li>",
    order   => '02',
  }
}
