# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include hardening::services
class hardening {

  class { 'hardening::services': }
  class { 'hardening::users':    } 

}
