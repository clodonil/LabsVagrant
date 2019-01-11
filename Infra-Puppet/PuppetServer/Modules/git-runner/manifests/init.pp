# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
class runner (
   String $runner_name = lookup('runner::runner_name'),
   String $runner_url  = lookup('runner::runner_url'),
   String $runner_token= lookup('runner::runner_token'),
) {

  class { 'runner::install':  
   } -> 

  class { 'runner::register': 
     runner_name  => $runner_name,
     runner_url   => $runner_url,
     runner_token => $runner_token,
  }
}
