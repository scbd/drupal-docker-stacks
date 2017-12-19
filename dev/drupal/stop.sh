docker stack rm DRUPAL
sleep 12s
docker volume rm drupal-files
printf 'y\n' | docker image prune
