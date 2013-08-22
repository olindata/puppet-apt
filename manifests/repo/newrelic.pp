class apt::repo::newrelic {

  apt::key { '548C16BF' :
    keyserver => 'hkp://subkeys.pgp.net',
  }

  # Repository and server lists: http://download.newrelic.com/debian/newrelic.list
  apt::repository { 'newrelic' :
    url         => 'http://apt.newrelic.com/debian/',
    distro      => $::lsbdistcodename,
    repository  => 'newrelic non-free',
    require     => Apt::Key['548C16BF'],
    source      => false,
  }
}

