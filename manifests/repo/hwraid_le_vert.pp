class apt::repo::hwraid_le_vert {

  apt::repository { 'hwraid':
    url         => 'http://hwraid.le-vert.net/debian',
    distro      => $::lsbdistcodename,
    repository  => 'main',
    source      => true
  }
}
