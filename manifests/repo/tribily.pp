class apt::repo::tribily {

  $distribution = inline_template('<%= scope.lookupvar(\'::lsbdistid\').downcase %>')

  case $distribution {
    'debian': {
      case $::lsbdistcodename {
        'lenny','squeeze': {
        }
        default: {
          err 'Only debian lenny and squeeze are currently supported by apt::repo::tribily'
        }
      }
    }
    'ubuntu': {
      case $::lsbdistcodename {
        'hardy','lucid','natty','oneiric': {
        }
        default: {
          err 'Only ubuntu hardy, lucid, natty and oneiric are currently supported by apt::repo::tribily'
        }
      }
    }
    default: {
      err 'Only debian and ubuntu are currently supported by apt::repo::tribily'
    }
  }

  apt::repository { 'tribily':
    url        => "http://apt.tribily.com/${distribution}",
    distro     => $::lsbdistcodename,
    repository => 'main',
    source     => false
  }
}
