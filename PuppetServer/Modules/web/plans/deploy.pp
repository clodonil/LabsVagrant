plan web::deploy(
TargetSpec $webserver,
) {
  $node="pcp://${webserver}"
  # Stop webservice
  $result=run_task('service::linux', $node,  name => 'httpd', action => 'stop')
  if ($result.ok) {
    file_upload('web/site.html','/var/www/html/index.html',$node)
    run_task('service::linux', $node,  name => 'httpd', action => 'start')
    notice("Deploy finalizado com sucesso!!!")

  }
}

