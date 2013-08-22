
# This is a compability layer for the apt::source defination provided by Puppetlabs apt module
#

define apt::source (
  $ensure            = present,
  $location          = '',
  $release           = 'UNDEF',
  $repos             = 'main',
  $include_src       = true,
  $required_packages = false,
  $key               = false,
  $key_server        = '',
  $key_content       = false,
  $key_source        = false,
  $pin               = false,
  $architecture      = undef
)
{

  if $required_packages != false {
    fail("key_content not supported in this incomplete puppetlab's apt::source compatabilty")
  }
  if $key_content != false {
    fail("key_content not supported in this incomplete puppetlab's apt::source compatabilty")
  }
  if $pin != false {
    fail("pin not supported in this incomplete puppetlab's apt::source compatabilty")
  }
  if $key == false {
    fail("key is required in this incomplete puppetlab's apt::source compatabilty")
  }
  if $ensure != 'present' {
    fail("ensure != present not supported in this incomplete puppetlab's apt::source compatabilty")
  }

  if $release == 'UNDEF' {
    if $::lsbdistcodename == undef {
      fail('lsbdistcodename fact not available: release parameter required')
    } else {
      $release_real = $::lsbdistcodename
    }
  } else {
    $release_real = $release
  }

  if $key_server != '' {
    apt::key { $key:
      keyserver => $key_server,
    }
  } else {
    if $key_source != false {
      apt::key { $key:
        url    => $key_source,
      }
    } else {
      # default key server of keyserver.ubuntu.com as per puppetlabs::apt
      apt::key { $key:
        keyserver => 'keyserver.ubuntu.com',
      }
    }
  }

  apt::repository { $name:
    ensure     => $ensure,
    url        => $location,
    distro     => $release_real,
    source     => $include_src,
    repository => $repos,
    require    => Apt::Key[$key],
  }

}

