class apt::repo::puppetlabs {

  # Add puppetlabs repository
  apt::key { "4BD6EC30": 
    keyserver  => "pool.sks-keyservers.net",
  }
  
  $distid = inline_template("<%= scope.lookupvar('::lsbdistid').downcase %>") 

  apt::repository { "puppetlabs":
    url        => "http://apt.puppetlabs.com/${::lsbdistid}",
    distro     => "${::lsbdistcodename}",
    repository => "main",
    require    => Apt::Key["4BD6EC30"],
    source     => true
  }
}