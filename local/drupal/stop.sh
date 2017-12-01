nohup docker-sync stop &
docker stack rm DRUPAL
docker stop docker-sync-drupal-config
docker stop docker-sync-drupal
