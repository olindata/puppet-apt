# Class for managing apt sources
class apt {
  
  # Aux packages
  package { "debconf-utils": 
    ensure => installed
  }

  if defined(Package["lsb-release"]) {
    notice("lsb-release already defined, skipping in module apt")
  } else {
    package { "lsb-release": 
      ensure => installed
    }
  }

  # Sources Dir
  file { "/etc/apt/sources.list.d":
    ensure  => directory,
    mode    => 0755,
    owner   => root,
    group   => 0,
  }

  # Setup apt options
  file { "/etc/apt/apt.conf":
    owner   => root,
    group   => root,
    mode    => 644,
  }

  # Setup apt sources
  file { "/etc/apt/sources.list":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => $apt::params::sources_list_src,
  }

  exec { aptget_update:
    command     => "/usr/bin/apt-get -qq update",
    logoutput   => false,
    refreshonly => true,
    subscribe   => [File["/etc/apt/sources.list"], File["/etc/apt/sources.list.d"], File["/etc/apt/apt.conf"]];
  }
}

