class apt::repo::lennybackports {

  #Add lenny-backports repository
  apt::key { "8347A27F":
    keyserver  => "keyring.debian.org",
  }

  apt::repository { "lenny-backports":
    url         => "http://backports.debian.org/debian-backports",
    distro      => "${::lsbdistcodename}-backports",
    repository  => "main",
    require     => Apt::Key["8347A27F"],
    source      => true
  }
}

