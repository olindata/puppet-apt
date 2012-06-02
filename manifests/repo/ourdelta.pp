class apt::repo::ourdelta {

  # Add puppetlabs repository
  apt::key { 'ourdelta':
    url => 'http://ourdelta.org/deb/ourdelta.gpg'
  }

  apt::repository { 'mariadb' :
    url         => 'http://mirror.ourdelta.org/deb',
    distro      => $::lsbdistcodename,
    repository  => 'mariadb-ourdelta',
    require     => Apt::Key['ourdelta'],
    source      => true,
  }
}
