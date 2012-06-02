# Class: apt::params
#
# Sets internal variables and defaults for apt module
# This class is automatically loaded in all the classes that use the values set here
#
class apt::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

  ## The location of sources.list (where puppet can find it)
  ## Example: "puppet:///my_module/source.list.lenny"
  $sources_list_src = $::apt_sources_list_src ? {
    ''      => '',
    default => $::apt_sources_list_src,
  }
}
