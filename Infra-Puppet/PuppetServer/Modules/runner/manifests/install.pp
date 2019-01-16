# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include runner::install
class runner::install {
   
   user {'gitlab-runner':
      ensure => 'present',
   }

   group {'gitlab-runner':
      ensure => 'present',
   }
   file { 'gitlab-runner':
     path   => '/usr/local/bin/gitlab-runner',
     ensure => 'file',
     mode   => 'a+x',
     source => 'https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64',
   }

   file { '/etc/gitlab-runner/':
        ensure => 'directory',
   }
         
  file {'/runner':
    ensure => 'directory',
    owner  => 'gitlab-runner',
    group  => 'gitlab-runner',
    mode   => '0750',
  }
}
