class apt::repo::dotdeb_org {

  apt::key { 'dotdeb':
    url => 'http://www.dotdeb.org/dotdeb.gpg'
  }

  apt::repository { 'dotdeb' :
    url         => 'http://ftp.hosteurope.de/mirror/packages.dotdeb.org/',
    distro      => 'oldstable',
    repository  => 'all',
    require     => Apt::Key['dotdeb'],
    source      => true,
  }
}
