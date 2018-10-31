# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include hardening::users
class hardening::users {

  user {'admin01':
    ensure => present,
    home   => '/home/admin01',
    shell  => '/bin/bash',
  }

  user {'admin02':
    ensure => present,
    home   => '/home/admin02',
    shell  => '/bin/bash',
  }
}
