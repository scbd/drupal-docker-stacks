docker exec -ti DRUPAL_php.1.$(docker service ps -f 'name=DRUPAL_php.1' DRUPAL_php -q) drush -r /var/www/html/web -y cex
docker exec -ti DRUPAL_php.1.$(docker service ps -f 'name=DRUPAL_php.1' DRUPAL_php -q) drush -r /var/www/html/web -y cr
