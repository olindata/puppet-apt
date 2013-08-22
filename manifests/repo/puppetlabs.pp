class apt::repo::puppetlabs {

  # Add puppetlabs repository
  apt::key { '4BD6EC30':
    keyserver  => 'pool.sks-keyservers.net',
  }

  if $::lsbdistcodename == 'squeeze' {
    $repository = 'main'
  } else {
    $repository = 'main dependencies'
  }
  apt::repository { 'puppetlabs':
    url        => 'http://apt.puppetlabs.com',
    distro     => $::lsbdistcodename,
    repository => $repository,
    require    => Apt::Key['4BD6EC30'],
    source     => true
  }
}
