# Class: apt::params
#
# Sets internal variables and defaults for apt module
# This class is automatically loaded in all the classes that use the values set here 
#
class apt::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

  ## The credentials to a mysql user that will be able to create other users, databases and grants
  $sources_list_src = $::apt_sources_list_src ? {
    ''      => "",
    default => "${::apt_sources_list_src}",
  }
}