class apt::repo::x2go {

  $distribution = inline_template('<%= scope.lookupvar(\'::lsbdistid\').downcase %>')

  case $distribution {
    'debian': {
      case $::lsbdistcodename {
        'lenny','oldstable','sid','squeeze','stable','testing','unstable','wheezy': {
        }
        default: {
          err 'Only Debian Lenny, Squeeze and Wheezy are currently supported by apt::repo::x2go'
        }
      }
    }
    'ubuntu': {
      case $::lsbdistcodename {
        'lucid','maverick','natty','oneiric','precise','quantal': {
        }
        default: {
          err 'Only Ubuntu Lucid, Maverick, Natty, Oneiric, Precise and Quantal are currently supported by apt::repo::x2go'
        }
      }
    }
    default: {
      err 'Only Debian and Ubuntu are currently supported by apt::repo::x2go'
    }
  }

  # Apt key for Debian's x2go repository
  apt::key { '5BFE2B6E':
    keyserver => 'hkp://keys.gnupg.net'
  }

  # Apt key for Ubuntu's x2go repository
  apt::key { '0A53F9FD':
    keyserver => 'hkp://keyserver.ubuntu.com'
  }

  apt::repository { 'x2go':
    url => $distribution ? {
        /debian/ => "http://packages.x2go.org/debian",
        /ubuntu/ => "http://ppa.launchpad.net/x2go/stable/ubuntu"
    },
    distro     => $::lsbdistcodename,
    repository => 'main',
    require => $distribution ? {
        /debian/ => Apt::Key['5BFE2B6E'],
        /ubuntu/ => Apt::Key['0A53F9FD'],
    }
  }
}

