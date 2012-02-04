class apt::repo::lennybackports {

  #Add lenny-backports repository
#  apt::key { "8347A27F":
#    keyserver  => "keyring.debian.org",
#  }

  package{ 'debian-backports-keyring':
    ensure => present
  }

  apt::repository { "lenny-backports":
    url         => "http://backports.debian.org/debian-backports",
    distro      => "${::lsbdistcodename}-backports",
    repository  => "main",
    require     => Package['debian-backports-keyring'],
    source      => true
  }
}

