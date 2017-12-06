docker volume create docker volume create --driver local \
    --opt type=tmpfs \
    --opt device=tmpfs \
    drupal-files
docker stack deploy -c drupal.yml DRUPAL
