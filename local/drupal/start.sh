nohup docker-sync start &
docker stack deploy -c drupal.yml DRUPAL

# exec on each start php security-checker.phar security:check $APP_ROOT/composer.lock
