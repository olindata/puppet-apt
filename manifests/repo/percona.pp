# Percona repositories, used for xtrabackup
class apt::repo::percona {

  apt::key { 'CD2EFD2A' :
    keyserver => 'hkp://zimmerman.mayfirst.org',
  }

  apt::repository { 'percona' :
    url         => 'http://repo.percona.com/apt',
    distro      => $::lsbdistcodename,
    repository  => 'main',
    require     => Apt::Key['CD2EFD2A'],
    source      => true,
  }
}

