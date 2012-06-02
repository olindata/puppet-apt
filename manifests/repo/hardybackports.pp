class apt::repo::hardybackports {

  #Add hardy-backports repository
  apt::key { '8347A27F': }

  apt::repository { 'hardy-backports':
    url => 'http://archive.ubuntu.com/ubuntu',
    distro => "${::lsbdistcodename}-backports",
    repository => 'main restricted universe multiverse',
    require     => Apt::Key['8347A27F'],
    source      => true
  }

}

