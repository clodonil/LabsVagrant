# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include runner::register
class runner::register (
   String $runner_name = lookup('runner::runner_name'),
   String $runner_url  = lookup('runner::runner_url'),
   String $runner_token= lookup('runner::runner_token'),
) {


  exec { 'register':
    command => "gitlab-runner register --non-interactive --url='${runner_url}' --registration-token '${runner_token}' --name '${runner_name}' --executor 'shell'",
    path    => ["/usr/local/bin/","/bin/","/usr/bin","/usr/sbin","/usr/local/bin/"],
    unless  => 'test  -e /etc/gitlab-runner/config.toml',
  }

  # install
  exec { 'install':
    command => 'gitlab-runner install --user gitlab-runner --working-directory /runner/',
    path    => ["/usr/local/bin/","/bin/","/usr/bin","/usr/sbin","/usr/local/bin/"],
    unless  =>  'test -e /etc/systemd/system/gitlab-runner.service', 

  }

  # Inicializar o servico
  service { 'gitlab-runner':
     ensure =>  running,
  }
  
}
