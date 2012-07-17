class apt::repo::lennybackports {

  package{ 'debian-backports-keyring':
    ensure => present
  }

  apt::repository { 'lenny-backports':
    url         => 'http://archive.debian.org/debian-backports',
    distro      => "${::lsbdistcodename}-backports",
    repository  => 'main',
    source      => true
  }
}

