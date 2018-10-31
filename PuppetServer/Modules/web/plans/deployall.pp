plan web::deployall {
  # Consulta no PuppetDB
  $result_db = puppetdb_query("inventory {facts.kernel = 'Linux'}")
  $names = $result_db.map |$r| { $r["certname"] }
  $nodes = $names.map |$n| { "pcp://${n}" }

  # Stop webservice
  $result=run_task('service::linux', $nodes,  name => 'httpd', action => 'stop')
  if ($result.ok) {
    file_upload('web/site.html','/var/www/html/index.html',$nodes)
    run_task('service::linux', $nodes,  name => 'httpd', action => 'start')
    notice("Deploy finalizado com sucesso!!!")
  }
}

