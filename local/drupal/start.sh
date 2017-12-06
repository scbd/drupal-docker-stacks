docker volume create docker-sync-drupal
docker volume create docker-sync-drupal-config
nohup docker-sync start &
docker stack deploy -c drupal.yml DRUPAL

# exec on each start php security-checker.phar security:check $APP_ROOT/composer.lock
sleep 4s
docker exec -ti DRUPAL_php.1.$(docker service ps -f 'name=DRUPAL_php.1' DRUPAL_php -q) php /var/www/html/sh/actions/security-checker.phar security:check $APP_ROOT/composer.lock
