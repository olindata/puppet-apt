class apt::repo::mariadb {

  # Add puppetlabs repository
  apt::key { "1BB943DB" :
    keyserver => "keyserver.ubuntu.com",
  }

  # deb http://mirror.xenserv.net/MariaDB/repo/5.2/debian squeeze main
  apt::repository { "mariadb" :
    url         => "http://ftp.osuosl.org/pub/mariadb/repo/5.2/debian",
    distro      => $::lsbdistcodename,
    repository  => "main",
    require    => Apt::Key["1BB943DB"]
  }
}

