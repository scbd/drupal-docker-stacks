
docker exec -ti DRUPAL_mariadb.1.$(docker service ps -f 'name=DRUPAL_mariadb.1' DRUPAL_mariadb -q) bash -c 'mysql -u drupal -pdrupal drupal < /docker-entrypoint-initdb.d/latest.sql'
