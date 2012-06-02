class apt::repo::squeezebackports {

  #Add squeeze-backports repository
  apt::key { '8347A27F':
    keyserver  => 'keyring.debian.org',
  }

  apt::repository { 'squeeze-backports':
    url         => 'http://backports.debian.org/debian-backports',
    distro      => "${::lsbdistcodename}-backports",
    repository  => 'main',
    require     => Apt::Key['8347A27F'],
    source      => true
  }
}

