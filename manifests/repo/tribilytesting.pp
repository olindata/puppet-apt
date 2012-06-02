class apt::repo::tribilytesting {

  $distribution = inline_template('<%= scope.lookupvar(\'::lsbdistid\').downcase %>')

  case $distribution {
    'debian': {
      case $::lsbdistcodename {
        'lenny','squeeze': {
        }
        default: {
          err 'Only debian lenny and squeeze are currently supported by apt::repo::tribilytesting'
        }
      }
    }
    'ubuntu': {
      case $::lsbdistcodename {
        'hardy','lucid','natty','oneiric': {
        }
        default: {
          err 'Only ubuntu hardy, lucid, natty and oneiric are currently supported by apt::repo::tribilytesting'
        }
      }
    }
    default: {
      err 'Only debian and ubuntu are currently supported by apt::repo::tribilytesting'
    }
  }

  apt::repository { 'tribily-testing':
    url        => "http://apt.tribily.com/${distribution}-testing",
    distro     => "${::lsbdistcodename}-testing",
    repository => 'main',
    source     => false
  }
}
