class apt::repo::hwraid_le_vert {

  apt::key { 'hwraid_le_vert':
    url => 'http://hwraid.le-vert.net/debian/hwraid.le-vert.net.gpg.key'
  }
  
  apt::repository { 'hwraid':
    url         => 'http://hwraid.le-vert.net/debian',
    distro      => $::lsbdistcodename,
    repository  => 'main',
    source      => true
  }
}
