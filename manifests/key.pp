# Define: apt::key
#
# Add key to keyring
#
# Usage:
#  apt::key { "key id":
#     url => 'key url',
#  }
#
#
define apt::key ($url = '', $keyserver = '') {
  case $url {
    '' : {
      case $keyserver {
        '' : {
          exec { "aptkey_add_${name}" :
            command => "/usr/bin/gpg --recv-key ${name} ; /usr/bin/gpg -a --export | /usr/bin/apt-key add -",
            unless => "/usr/bin/apt-key list | /bin/grep -q ${name}",
          }
        }
        default : {
          exec { "aptkey_add_${name}" :
            command => "/usr/bin/gpg --keyserver ${keyserver} --recv-key ${name} ; /usr/bin/gpg -a --export | /usr/bin/apt-key add -",
            unless => "/usr/bin/apt-key list | /bin/grep -q ${name}",
          }
        }
      }
    }
    default : {
      exec { "aptkey_add_${name}" :
        command => "/usr/bin/wget -O - ${url} | /usr/bin/apt-key add -",
        unless => "/usr/bin/apt-key list | /bin/grep -q ${name}",
      }
    }
  }
}
