# Percona repositories, used for xtrabackup
class apt::repo::percona {

  # Add puppetlabs repository
  apt::key { "1C4CBDCDCD2EFD2A" :
    keyserver => "hkp://zimmerman.mayfirst.org",
  }

  apt::repository { "percona" :
    url         => "http://repo.percona.com/apt",
    distro      => $::lsbdistcodename,
    repository  => "main",
    require     => Apt::Key["1C4CBDCDCD2EFD2A"],
    source      => true,
  }
}

