# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include motd::config
class motd::config (
    String $mensagem = lookup('motd::mensagem'),
){

  file { '/etc/motd':
    ensure  => file,
    content => epp('motd/motd.conf.epp', { mensagem => $mensagem}),
  }


}
