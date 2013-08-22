class apt::repo::mariadb($version = '5.2') {

  apt::key { '1BB943DB' :
    keyserver => 'keyserver.ubuntu.com',
  }

  #deb http://mirror2.hs-esslingen.de/mariadb/repo/5.2/debian lenny main
  #deb-src http://mirror2.hs-esslingen.de/mariadb/repo/5.2/debian lenny main
  apt::repository { 'mariadb' :
    url         => "http://ftp.osuosl.org/pub/mariadb/repo/${version}/debian",
    distro      => $::lsbdistcodename,
    repository  => 'main',
    require     => Apt::Key['1BB943DB'],
    source      => true,
  }
}

