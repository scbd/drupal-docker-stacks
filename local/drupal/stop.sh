nohup docker-sync stop &
docker stack rm DRUPAL
docker stop docker-sync-drupal-config
docker stop docker-sync-drupal
sleep 8s
printf 'y\n' | docker image prune
printf 'y\n' | docker volume prune
docker volume rm docker-sync-drupal
docker volume rm docker-sync-drupal-config
