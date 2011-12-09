class apt::repo::puppetlabs {

  # Add puppetlabs repository
  apt::key { "4BD6EC30": 
    keyserver  => "pool.sks-keyservers.net",
  }

  apt::repository { "puppetlabs":
    url        => "http://apt.puppetlabs.com/debian",
    distro     => "${::lsbdistcodename}",
    repository => "main",
    require    => Apt::Key["4BD6EC30"]
  }
}